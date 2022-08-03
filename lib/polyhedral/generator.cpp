#include "generator.h"
#include <string>
#include <iostream>
#include "scalehls/Transforms/Passes.h"
#include "scalehls/Transforms/Utils.h"
#include "scalehls/Transforms/QoREstimation.h"
#include "llvm/Support/MemoryBuffer.h"
#include "mlir/Dialect/Affine/Analysis/Utils.h"
#include "mlir/Dialect/Affine/IR/AffineValueMap.h"
#include "mlir/Support/FileUtilities.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/Support/MemoryBuffer.h"

// using namespace scalehls;
namespace polyfp{

// For each node of the ISL AST, the corresponding computation is stored.
// This function retrieves that computation.
polyfp::compute *get_computation_annotated_in_a_node(isl_ast_node *node)
{
    // Retrieve the computation of the node.
    isl_id *comp_id = isl_ast_node_get_annotation(node);
    polyfp::compute *comp = (polyfp::compute *)isl_id_get_user(comp_id);
    isl_id_free(comp_id);
    return comp;
    
}




std::map<std::string,mlir::Value> polyfp::MLIRGenImpl::get_argument_map(){
    return this->argument_map;
}

std::vector<mlir::FuncOp>  polyfp::MLIRGenImpl::get_funcs(){
    return this->funcs;
}


mlir::ModuleOp polyfp::MLIRGenImpl::mlirGen1(const polyfp::function &fct, isl_ast_node *isl_node, int &level, bool flag, bool flag2, bool if_flag) {

    std::vector<std::pair<std::string, std::string>> generated_stmts;

    isl_ast_node *node=isl_node;

    if (isl_ast_node_get_type(node) == isl_ast_node_for){
        // std::cout<<"Enter a for node of level:";
        // std::cout<<level<<std::endl;

        isl_ast_expr *iter = isl_ast_node_for_get_iterator(node);
        // std::cout<<isl_ast_expr_to_str(iter)<<std::endl;
        isl_id *identifier = isl_ast_expr_get_id(iter);
        std::string name_str(isl_id_get_name(identifier));
        // std::cout<<"the dimension is :"+ name_str<<std::endl;
        name_map.insert(std::pair(level,name_str));
        isl_ast_expr *init = isl_ast_node_for_get_init(node);
        // std::cout<<isl_ast_expr_to_str(init)<<std::endl;
        isl_ast_expr *cond = isl_ast_node_for_get_cond(node);
        // std::cout<<isl_ast_expr_to_str(cond)<<std::endl;
        isl_ast_expr *inc = isl_ast_node_for_get_inc(node);
        isl_ast_node *body = isl_ast_node_for_get_body(node);
        // if (isl_ast_node_get_type(body) == isl_ast_node_block)
        // {
        //     std::cout<<"111isl_ast_node_block"<<std::endl;
        // }else if (isl_ast_node_get_type(body) == isl_ast_node_user)
        // {
        //     std::cout<<"111isl_ast_node_user"<<std::endl;
        // }else if (isl_ast_node_get_type(body) == isl_ast_node_for)
        // {
        //     std::cout<<"111isl_ast_node_for"<<std::endl;
        // }
        int lb_int;
        int ub_int;
        bool vbound_flag = false;
        std::vector<mlir::Value> lb_values;
        std::vector<mlir::AffineExpr> lb_args;
        std::vector<mlir::Value> ub_values;
        std::vector<mlir::AffineExpr> ub_args;

        isl_ast_expr *cond_upper = isl_ast_expr_get_op_arg(cond, 1);
        if (isl_ast_expr_get_type(init) == isl_ast_expr_int){
            lb_int = isl_val_get_num_si(isl_ast_expr_get_val(init));
        }
        else if (isl_ast_expr_get_type(init) == isl_ast_expr_op){
            std::cout<<"enter a lower bound node"<<std::endl;
            vbound_flag = true;
            
            // std::vector<mlir::Value> values;
            // std::vector<mlir::AffineExpr> args;
            // polyfp::compute *comp;
            // const auto &cpt = fct.get_body()[0];
            // std::vector<mlir::Type> types;
            // comp = cpt;
            // for (auto &kv: comp->get_placeholder_dims()){

            // }
            int nb = isl_ast_expr_get_op_n_arg(init);
            std::cout<<"number of args: ";
            std::cout<<nb<<std::endl;
            for(int i=0;i<nb;i++)
            {
                isl_ast_expr *expr_itr = isl_ast_expr_get_op_arg(init, i);
                if (isl_ast_expr_get_type(expr_itr) == isl_ast_expr_int){
                    lb_args.push_back(getAffineConstantExpr(isl_val_get_num_si(isl_ast_expr_get_val(expr_itr)), builder.getContext()));
                }
                else if (isl_ast_expr_get_op_type(expr_itr) == isl_ast_op_sub){
                    std::cout<<"isl_ast_op_sub "<<std::endl;
                    isl_ast_expr *expr0 = isl_ast_expr_get_op_arg(expr_itr, 0);
                    isl_ast_expr *expr1 = isl_ast_expr_get_op_arg(expr_itr, 1);
                    int add1;
                    if (isl_ast_expr_get_type(expr0) == isl_ast_expr_id)
                    {//TODO: find right dimensions
                        isl_id *identifier = isl_ast_expr_get_id(expr0);
                        std::string name_str(isl_id_get_name(identifier));
                        int loc;
                        for (auto &kv4: name_map){
                            if(name_str==kv4.second){
                                loc = kv4.first;
                            }
                        }
                        

                        mlir::Value value = ops[loc].getInductionVar();
                        lb_values.push_back(value);
                        
                        isl_id_free(identifier);
                    }  
                    if (isl_ast_expr_get_type(expr1) == isl_ast_expr_int)
                    {   
                        add1 = isl_val_get_num_si(isl_ast_expr_get_val(expr1))+1;
                    }  
                    //TODO: find right dimensions
                    // args.push_back(builder.getAffineDimExpr(0) + isl_val_get_num_si(isl_ast_expr_get_val(expr_itr)));
                    lb_args.push_back(builder.getAffineDimExpr(0) - add1);
                    
                }
                // else if (isl_ast_expr_get_type(expr_itr) == isl_ast_expr_id){
                //     isl_id *identifier = isl_ast_expr_get_id(expr_itr);
                //     std::string name_str(isl_id_get_name(identifier));
                //     std::cout<<"the dimension is :"+ name_str<<std::endl;
                //     // std::cout<<"enter a oppp1111 bound node"+name_str<<std::endl;
                //     isl_id_free(identifier);

                // }
                else{
                    polyfp::str_dump("Transforming the following expression",
                           (const char *)isl_ast_expr_to_C_str(expr_itr));
                }
                
                    
                isl_ast_expr_free(expr_itr);

            }

            

            
            // auto map = mlir::AffineMap::get(1, 0, ArrayRef<mlir::AffineExpr> (args),builder.getContext());

            // mlir::ValueRange vr=llvm::makeArrayRef(values);
            // auto max_op = builder.create<mlir::AffineMaxOp>(builder.getUnknownLoc(),map,vr);
            // theModule.push_back(max_op);
            
            // std::cout<<std::to_string(a)<<std::endl;

        }


        auto lb_map = mlir::AffineMap::get(1, 0, ArrayRef<mlir::AffineExpr> (lb_args),builder.getContext());

        mlir::ValueRange lb_vr=llvm::makeArrayRef(lb_values);
        // std::cout<<lb_values.size()<<std::endl;
        // std::cout<<lb_args.size()<<std::endl;
        // auto max_op = builder.create<mlir::AffineMaxOp>(builder.getUnknownLoc(),lb_map,lb_vr);


        
        if (isl_ast_expr_get_type(cond_upper) == isl_ast_expr_int){
            ub_int = isl_val_get_num_si(isl_ast_expr_get_val(cond_upper))+1;
        }
        else if (isl_ast_expr_get_type(cond_upper) == isl_ast_expr_op){
            vbound_flag = true;
            
            // std::vector<mlir::Value> values;
            // std::vector<mlir::AffineExpr> args;
            // polyfp::compute *comp;
            // const auto &cpt = fct.get_body()[0];
            // std::vector<mlir::Type> types;
            // comp = cpt;
            // for (auto &kv: comp->get_placeholder_dims()){
            // mlir::Value value = ops[0].getInductionVar();
            // values.push_back(value);
            // }
            int nb = isl_ast_expr_get_op_n_arg(cond_upper);
            int sub1;
            // std::cout<<"number of args: ";
            // std::cout<<nb<<std::endl;

            for(int i=0;i<nb;i++)
            {   
                isl_ast_expr *expr_itr = isl_ast_expr_get_op_arg(cond_upper, i);
                if (isl_ast_expr_get_type(expr_itr) == isl_ast_expr_int){
                    ub_args.push_back(getAffineConstantExpr(isl_val_get_num_si(isl_ast_expr_get_val(expr_itr))+1, builder.getContext()));
                }
                // else if (isl_ast_expr_get_op_type(expr_itr) == isl_ast_op_sub){
                //     std::cout<<"isl_ast_op_sub "<<std::endl;
                //     isl_ast_expr *expr0 = isl_ast_expr_get_op_arg(expr_itr, 0);
                //     isl_ast_expr *expr1 = isl_ast_expr_get_op_arg(expr_itr, 1);
                //     int add1;
                //     if (isl_ast_expr_get_type(expr0) == isl_ast_expr_id)
                //     {//TODO: find right dimensions
                //         isl_id *identifier = isl_ast_expr_get_id(expr0);
                //         std::string name_str(isl_id_get_name(identifier));
                //         int loc;
                //         for (auto &kv4: name_map){
                //             if(name_str==kv4.second){
                //                 loc = kv4.first;
                //             }
                //         }
                        

                //         mlir::Value value = ops[loc].getInductionVar();
                //         lb_values.push_back(value);
                        
                //         isl_id_free(identifier);
                //     }  
                //     if (isl_ast_expr_get_type(expr1) == isl_ast_expr_int)
                //     {   
                //         add1 = isl_val_get_num_si(isl_ast_expr_get_val(expr1))+1;
                //     }  
                //     //TODO: find right dimensions
                //     // args.push_back(builder.getAffineDimExpr(0) + isl_val_get_num_si(isl_ast_expr_get_val(expr_itr)));
                //     lb_args.push_back(builder.getAffineDimExpr(0) - add1);
                    
                // }
                else if (isl_ast_expr_get_type(expr_itr) == isl_ast_expr_id){
                    isl_id *identifier = isl_ast_expr_get_id(expr_itr);
                    std::string name_str(isl_id_get_name(identifier));
                    int loc;
                    for (auto &kv4: name_map){
                        if(name_str==kv4.second){
                            loc = kv4.first;
                        }
                    }

                    mlir::Value value = ops[loc].getInductionVar();
                    ub_values.push_back(value);
                    isl_id_free(identifier);
                    ub_args.push_back(builder.getAffineDimExpr(0));

                }else{
                    polyfp::str_dump("Transforming the following expression",
                           (const char *)isl_ast_expr_to_C_str(expr_itr));
                }
                
                    
                isl_ast_expr_free(expr_itr);

            }
            
            

            
            // auto ub_map = mlir::AffineMap::get(1, 0, ArrayRef<mlir::AffineExpr> (ub_args),builder.getContext());

            // mlir::ValueRange ub_vr=llvm::makeArrayRef(ub_values);
           
            // theModule.push_back(max_op);
            // theModule->dump();
            // std::cout<<std::to_string(a)<<std::endl;

        }

        auto ub_map = mlir::AffineMap::get(1, 0, ArrayRef<mlir::AffineExpr> (ub_args),builder.getContext());
        
        // std::cout<<ub_values.size()<<std::endl;
        // std::cout<<ub_args.size()<<std::endl;
        // theModule->dump();

        mlir::ValueRange ub_vr=llvm::makeArrayRef(ub_values);
        // auto min_op = builder.create<mlir::AffineMinOp>(builder.getUnknownLoc(),ub_map,ub_vr);
        // auto min_op = builder.create<mlir::AffineMinOp>(builder.getUnknownLoc(),ub_map,ub_vr);
        // theModule->dump();
        
        // int lb = isl_val_get_num_si(isl_ast_expr_get_val(init));
        // int ub = isl_val_get_num_si(isl_ast_expr_get_val(cond_upper));
        int step = isl_val_get_num_si(isl_ast_expr_get_val(inc));

        
        if (isl_ast_node_get_type(node) == isl_ast_node_for){
            // polyfp::compute *comp;
            // const auto &cpt = fct.get_body()[0];
            // comp = cpt;
            if(level== 0){
              


                std::vector<mlir::Type> types;
                
                std::string name = polyfp::global::get_implicit_function()->get_name();
                mlir::Location loc = builder.getUnknownLoc();
                auto varLoc = loc;

                llvm::SmallVector<mlir::Type, 4> operandTypes;
                mlir::Type t;
                mlir::MemRefType mr;

                for (auto &kv : fct.get_invariants()) {
                    //TODO: more datatype
                    if(kv.second->get_type() == polyfp::p_float64){
                        t= builder.getF64Type();
                        
                    }
                    if(kv.second->get_type() == polyfp::p_float32){
                        t= builder.getF32Type();
                        
                    }
                    operandTypes.push_back(t);
                    argument_list.push_back(kv.first);
                }

                // int placeholder_number = 0;
                std::vector<std::string> p_names;

       
                
                for (auto &kv : fct.get_placeholders()) {
                    
                    unsigned memspace = 0;
                    auto size = kv.second->get_dim_sizes();
                    auto arg_type = kv.second->get_elements_type();
                    p_names.push_back(kv.first);

                    if (arg_type == polyfp::p_uint8 || arg_type == polyfp::p_int8){
                    
                        t= builder.getIntegerType(8);
                    }else if(arg_type == polyfp::p_uint16 || arg_type == polyfp::p_int16){
                        t= builder.getIntegerType(16);
                    }else if(arg_type == polyfp::p_uint32 || arg_type == polyfp::p_int32){
                        t= builder.getIntegerType(32);
                    }else if(arg_type == polyfp::p_uint64 || arg_type == polyfp::p_int64){
                        t= builder.getIntegerType(64);
                    }else if(arg_type == polyfp::p_float32){
                        t= builder.getF32Type();
                    }else if(arg_type == polyfp::p_float64){
                        t= builder.getF64Type();
                    }
                    mr = mlir::MemRefType::get(llvm::makeArrayRef(size), t, {}, memspace);
                    operandTypes.push_back(mr);
                    argument_list.push_back(kv.first);
                    // placeholder_number+=1;
                }
      
                if(flag ==true){
                    mlir::FuncOp myFunc = mlir::FuncOp::create(loc, /*name=*/name, /*type=*/builder.getFunctionType(operandTypes, {}), /*attrs=*/{}); // Line 6
                    auto &entryBlock = *myFunc.addEntryBlock();
                    builder.setInsertionPointToStart(&entryBlock);
                    funcs.push_back(myFunc);
                    theModule.push_back(myFunc);
                    // for(int i = 0; i< placeholder_number; i++){
                    //     auto mem = myFunc.getArgument(index_placeholder);
                    //     myFunc.getArugment();
                    // }
                    int index_pname = 0;
                    for(auto &p_name: p_names){
                        auto mem = myFunc.getArgument(index_pname);
                        index_pname+=1;
                        argument_map.insert(std::pair(p_name,mem));
                    }
                    
                    //TODO, here builder.getI16IntegerAttr(5) is directly written ,actually we need to get the value in right data type
                    // mlir::Value arg1 = builder.create<mlir::arith::ConstantOp>(builder.getUnknownLoc(),t, builder.getF32ArrayAttr(3.0));
                    // mlir::Value arg2 = builder.create<mlir::arith::ConstantOp>(builder.getUnknownLoc(),t, builder.getF32ArrayAttr(6.7));


                    // mlir::Value arg1 = builder.create<mlir::arith::ConstantOp>(builder.getUnknownLoc(),t, builder.getI16IntegerAttr(5));
                    // mlir::Value arg2 = builder.create<mlir::arith::ConstantOp>(builder.getUnknownLoc(),t, builder.getI16IntegerAttr(1));
                    // args.push_back(arg1);    
                    // args.push_back(arg2); 


            
                    if(vbound_flag == false){
                        auto loop = builder.create<mlir::AffineForOp>(builder.getUnknownLoc(), lb_int, ub_int, step);
                        ops.push_back(loop);
                        builder.setInsertionPointAfter(ops[0]);
                        auto return_op = builder.create<mlir::func::ReturnOp>(builder.getUnknownLoc(), ArrayRef<mlir::Value>());
                        builder.setInsertionPointToStart(loop.getBody());
                        // mlir::scalehls::setLoopDirective(loop, true, 1, false, false);

                    }else{
                        
                        // auto loop = builder.create<mlir::AffineForOp>(builder.getUnknownLoc(), max_op, min_op, step);
                        auto loop = builder.create<mlir::AffineForOp>(builder.getUnknownLoc(), lb_vr, lb_map, ub_vr, ub_map, step);
                        ops.push_back(loop);
                        builder.setInsertionPointAfter(ops[0]);
                        auto return_op = builder.create<mlir::func::ReturnOp>(builder.getUnknownLoc(), ArrayRef<mlir::Value>());
                        builder.setInsertionPointToStart(loop.getBody());
   
                        // mlir::scalehls::setLoopDirective(loop, true, 1, false, false);

                    }
                    // for(auto &kv : comp->get_directive_map()){
                    //     if(kv.second == "pipeline"){
                    //         int loc = comp->get_loop_level_number_from_dimension_name(kv.first);
                    //         if(level == loc){
                    //              mlir::scalehls::setLoopDirective(ops[loc], true, 1, false, false);
                    //         }
                           

                    //     }
                    // }  
                    
                    
                    
              
                    
                    
                    // builder.setInsertionPointAfter(ops[0]);
                    // auto return_op = builder.create<mlir::func::ReturnOp>(builder.getUnknownLoc(), ArrayRef<mlir::Value>());
                    // builder.setInsertionPointToStart(loop.getBody());

                }else{
                    // auto loop = builder.create<mlir::AffineForOp>(builder.getUnknownLoc(), lb_int, ub_int, step);
                    
                    // ops.push_back(loop);
                    
                    // builder.setInsertionPointAfter(ops[0]);
                    // builder.setInsertionPointToStart(loop.getBody());
                    if(vbound_flag == false){
                        auto loop = builder.create<mlir::AffineForOp>(builder.getUnknownLoc(), lb_int, ub_int, step);
                        ops.push_back(loop);
                        builder.setInsertionPointAfter(ops[0]);
                        builder.setInsertionPointToStart(loop.getBody());

                    }else{
                        auto loop = builder.create<mlir::AffineForOp>(builder.getUnknownLoc(), lb_vr, lb_map, ub_vr, ub_map, step);
                        ops.push_back(loop);
                        builder.setInsertionPointAfter(ops[0]);
                        builder.setInsertionPointToStart(loop.getBody());

                    }
                    // for(auto &kv : comp->get_directive_map()){
                    //     if(kv.second == "pipeline"){
                    //         int loc = comp->get_loop_level_number_from_dimension_name(kv.first);
                    //         if(level == loc){
                    //              mlir::scalehls::setLoopDirective(ops[loc], true, 1, false, false);
                    //         }
                           

                    //     }
                    // }  
                }
                


                
                
            }else {
                
                
                // auto loop = builder.create<mlir::AffineForOp>(builder.getUnknownLoc(), vr,map,  vr,map, step);
                // auto loop = builder.create<mlir::AffineForOp>(builder.getUnknownLoc(), lb_int ,ub_int, step);

                
                if(vbound_flag == false){
                    auto loop = builder.create<mlir::AffineForOp>(builder.getUnknownLoc(), lb_int, ub_int, step);
                    ops.push_back(loop);
                    builder.setInsertionPointAfter(ops[0]);
                    builder.setInsertionPointToStart(loop.getBody());
                    // for(auto &kv : comp->get_directive_map()){
                    //     if(kv.second == "pipeline"){
                    //         int loc = comp->get_loop_level_number_from_dimension_name(kv.first);
                    //         if(level == loc){
                    //              mlir::scalehls::setLoopDirective(ops[loc], true, 1, false, false);
                    //         }
                           

                    //     }
                    // }  

                }else{
                    
                    std::cout<<"index????"<<std::endl;
                    auto loop = builder.create<mlir::AffineForOp>(builder.getUnknownLoc(), lb_vr, lb_map, ub_vr, ub_map, step);
                    ops.push_back(loop);
                    builder.setInsertionPointAfter(ops[0]);
                    builder.setInsertionPointToStart(loop.getBody());


                }
                // builder.setInsertionPointAfter(ops[level-1]);
                // builder.setInsertionPointToStart(loop.getBody());
                // ops.push_back(loop);
                // theModule->dump();
                
            }
            
                
            
            
            

        }
        // std::cout<<"The loop dump"<<std::endl;
        theModule->dump();
        isl_ast_expr_free(init);
        isl_ast_expr_free(cond);
        isl_ast_expr_free(inc);
        isl_ast_node_free(body);
        isl_ast_expr_free(cond_upper);
        // std::cout<<level<<std::endl;
        
        if (isl_ast_node_get_type(body) == isl_ast_node_for)
        {   
            level = level+1;
            mlirGen1(fct,body,level,false,flag2,if_flag);
        }
        if (isl_ast_node_get_type(body) == isl_ast_node_user)
        {
            mlirGen1(fct,body,level,false,flag2,if_flag);
        }
        else if(isl_ast_node_get_type(body) == isl_ast_node_block){
            
            // std::cout<<"We get a block"<<std::endl;
            mlirGen1(fct,body,level,false,flag2,if_flag);
        }else if(isl_ast_node_get_type(body) == isl_ast_node_if){
            // std::cout<<"We get a if"<<std::endl;
        }
        else{
                // std::cout<<"We get a if"<<std::endl;
        }
    }else if (isl_ast_node_get_type(node) == isl_ast_node_block)
    {
        // std::cout<<"enter a block node"<<std::endl;
        isl_ast_node_list *list = isl_ast_node_block_get_children(node);
        // std::cout<<" block size:"+std::to_string(isl_ast_node_list_n_ast_node(list) - 1)<<std::endl;
        int current_level = level;

        for (int i = 0; i <=isl_ast_node_list_n_ast_node(list) - 1; i++)
        {   
            isl_ast_node *child = isl_ast_node_list_get_ast_node(list, i);
            // childs.push_back(child);
            if (isl_ast_node_get_type(child) == isl_ast_node_user){
                // std::cout<<"a user block"<<std::endl;

                // builder.setInsertionPointToEnd(ops[level-1].getBody());
                
                mlirGen1(fct,child,current_level,false,true,if_flag);
                
                // if(i == isl_ast_node_list_n_ast_node(list) - 1){
                //     builder.setInsertionPointAfter(ops[level-1]);
                // }
                // std::cout<<"an expression of level:";
                // std::cout<<level<<std::endl;

                //  mlirGen1(fct,childs[1],level);
            }else if (isl_ast_node_get_type(child) == isl_ast_node_for){
                // builder.setInsertionPointToEnd(ops[level-1].getBody());
                // std::cout<<"a for block"<<std::endl;
                
                if(this->ops.size() != 0){
                    level = level + 1 ;
                    int current_level = level;
                    // std::cout<<"total number of loops :";
                    // std::cout<<ops.size()<<std::endl;
                    // std::cout<<"current loop :";
                    // std::cout<<level<<std::endl;
                            
                    start_loops_position.push_back(level);
                    mlirGen1(fct,child,level,false,true,if_flag);
                   

                    
                    
                    builder.setInsertionPointAfter(ops[current_level]);
                }
                // else if(this->ops.size()==0){
                //     // std::cout<<"total number of loops :";
                //     // std::cout<<ops.size()<<std::endl;
                //     // std::cout<<"current loop :";
                //     // std::cout<<level<<std::endl;
                //     start_loops_position.push_back(level);
                //     mlirGen1(fct,child,level,true, false, false);   
                //     builder.setInsertionPointAfter(ops[current_level]);
                    
                // }
                else{
                    start_loops_position.push_back(level);
                    mlirGen1(fct,child,level,true, false, false);   
                    builder.setInsertionPointAfter(ops[current_level]);
                    
                }
                
                
                //  if(i == isl_ast_node_list_n_ast_node(list) - 1){
                //     builder.setInsertionPointAfter(ops[level-1]);
                //  }
                //  std::cout<<"a for"<<std::endl;
                //  theModule.dump();

                //  mlirGen1(fct,childs[1],level);
            }else if (isl_ast_node_get_type(child) == isl_ast_node_block){
                // std::cout<<"a another block"<<std::endl;
                 mlirGen1(fct,child,level,false,true,if_flag);
                //  if(i == isl_ast_node_list_n_ast_node(list) - 1){
                //     builder.setInsertionPointAfter(ops[level-1]);
                //  }
                 

                //  mlirGen1(fct,childs[1],level);
            }else if (isl_ast_node_get_type(child) == isl_ast_node_if){
                // std::cout<<"a if"<<std::endl;
                mlirGen1(fct,child,level,false,true,if_flag);
                //  if(i == isl_ast_node_list_n_ast_node(list) - 1){
                //     builder.setInsertionPointAfter(ops[level-1]);
                //  }
                 

                //  mlirGen1(fct,childs[1],level);
            }else{
                // std::cout<<"other block type"<<std::endl;
            }
            // return theModule;
            
            
        }
        // std::cout<<"finish block"<<std::endl;
       
    }else if (isl_ast_node_get_type(node) == isl_ast_node_user)
    {
        bool flag = true;
        std::cout<<"enter a user node"<<std::endl;
        
        isl_ast_expr *expr = isl_ast_node_user_get_expr(node);
        isl_ast_expr *arg = isl_ast_expr_get_op_arg(expr, 0);
        isl_id *id = isl_ast_expr_get_id(arg);
        std::string computation_name(isl_id_get_name(id));
        std::cout<<"computation_name"+computation_name<<std::endl;
        isl_id_free(id);
        polyfp::compute *comp;
        int dim_number = 0;
        for (const auto &cpt : fct.get_body())
        {
            if(cpt->get_name()==computation_name){
                // std::cout<<cpt->get_name()<<std::endl;
                comp = cpt;
            }
            
            if(dim_number < cpt->get_loop_levels_number())
                dim_number = cpt->get_loop_levels_number();
                

        }
        
        auto polyfp_expr = comp->get_expr();
        
        std::string p_name = comp->get_placeholder()->get_name();
        std::cout<<"p_name"+p_name<<std::endl;
        int index_placeholder;
        int index_argument;
        for(int i=0; i<argument_list.size(); i++){
            if(argument_list.at(i) == p_name){
                index_placeholder = i;
            }
        }

        std::vector<mlir::Value> placeholder_index_values;
        // for (auto &kv: comp->get_placeholder_dims()){
        //     mlir::Value value = ops[comp->get_loop_level_number_from_dimension_name(kv.get_name())].getInductionVar();
        //     values.push_back(value);
        // }
        ////////////////////////////////////////////////////////
        SmallVector<mlir::AffineExpr> placeholder_index_args;


        theModule.dump();
        bool placeholder_index_flag = false;
        int count = 0;
        for (auto &kv: comp->get_placeholder_dims()){
            int bias = 0;
            std::cout<<"here"<<std::endl;
            if(kv.get_expr_type() == polyfp::e_op){
                auto expr0 = kv.get_operand(0);
                auto expr1 = kv.get_operand(1);
                auto left_index = a_print_index(expr0,comp,placeholder_index_values);
                auto right_index = a_print_index(expr1,comp,placeholder_index_values);
                int loc =  0;
                if(kv.get_op_type() == polyfp::o_sub){
                    placeholder_index_args.push_back(left_index - right_index);

                    // index_args.push_back(builder.getAffineDimExpr(0) + builder.getAffineDimExpr(1));
                    placeholder_index_flag = true;

                }else if(kv.get_op_type() == polyfp::o_add){
                    placeholder_index_args.push_back(left_index + right_index);
                    placeholder_index_flag = true;
                    
                }else if(kv.get_op_type() == polyfp::o_mul){
                    placeholder_index_args.push_back(left_index * right_index);
                    placeholder_index_flag = true;
                    
                }else if(kv.get_op_type() == polyfp::o_div){
                    placeholder_index_args.push_back(left_index.floorDiv(right_index));
                    placeholder_index_flag = true;
                    
                }


            }
            else{
                std::cout<<"here2"<<std::endl;
                int loc =0;
                int loc_2 =0;
                std::string tile_name1;
                std::string tile_name2;
                int tile_size;
                auto name_set = comp->get_loop_level_names();
                if ( std::find(name_set.begin(), name_set.end(), kv.get_name()) == name_set.end() ){

                    std::cout<<"here3"<<std::endl;

                    for (auto &kv2: comp->get_access_map()){
                        if(kv.get_name()==kv2.first){

                            tile_name1 = kv2.second;
                    
                            loc = comp->get_loop_level_number_from_dimension_name(kv2.second);
                      
                    
                            

                        }
                    }
                   // Jason: loc = loc + loop position
                    mlir::Value value = ops[loc].getInductionVar();
                    std::cout<<loc<<std::endl;
                    if ( std::find(placeholder_index_values.begin(), placeholder_index_values.end(), value)== placeholder_index_values.end() ){
                        std::cout<<"here4"<<std::endl;
                        
                        placeholder_index_values.push_back(value);
                    }
    
                    if(comp->is_tiled == true){
                        

                        for (auto &kv3: comp->get_tile_map()){
                            if(tile_name1==kv3.first){
                                loc_2 = comp->get_loop_level_number_from_dimension_name(kv3.second);
                                tile_name2 = kv3.second;
                            }
                        }
                        
                        for (auto &kv4: comp->get_tile_size_map()){
                            if(tile_name1==kv4.first){
                                tile_size = kv4.second;
                            }
                        }
                        
                       
                        

                        mlir::Value value2 = ops[loc_2].getInductionVar();
                       
                    
                        if ( std::find(placeholder_index_values.begin(), placeholder_index_values.end(), value2)== placeholder_index_values.end() ){
                            placeholder_index_values.push_back(value2);
                        }
                        int index_2 = std::find(placeholder_index_values.begin(), placeholder_index_values.end(), value2) - placeholder_index_values.begin();
                        int index = std::find(placeholder_index_values.begin(), placeholder_index_values.end(), value) - placeholder_index_values.begin();
                        placeholder_index_args.push_back(builder.getAffineDimExpr(index)+builder.getAffineDimExpr(index_2)*tile_size);
                        placeholder_index_flag = true;
                    }
                    
                    

                }else{
                    std::cout<<"22222222222222222222222"<<std::endl;
                    loc = comp->get_loop_level_number_from_dimension_name(kv.get_name());


                    //zhe li location = 0
                    // std::cout<<"else there"<<std::endl;
                    // std::cout<<"the location is : "+std::to_string(comp->get_loop_level_number_from_dimension_name(kv2.second))<<std::endl;
                    
                    mlir::Value value = ops[comp->get_loop_level_number_from_dimension_name(kv.get_name())].getInductionVar();
                    std::cout<<"dimension"+std::to_string(comp->get_loop_level_number_from_dimension_name(kv.get_name()))<<std::endl;
                    if ( std::find(placeholder_index_values.begin(), placeholder_index_values.end(), value) == placeholder_index_values.end()){
                        placeholder_index_values.push_back(value);
                    }
                    int index = std::find(placeholder_index_values.begin(), placeholder_index_values.end(), value) - placeholder_index_values.begin();
                    placeholder_index_args.push_back(builder.getAffineDimExpr(index));
                }
            
                // std::cout<<"else there"<<std::endl;
            }
                // std::cout<<"else there1"<<std::endl;
        }

       
        std::cout<<"number of "+std::to_string(placeholder_index_values.size())<<std::endl;
        std::cout<<"number of "+std::to_string(placeholder_index_args.size())<<std::endl;
        

        auto placeholder_map = mlir::AffineMap::get(placeholder_index_values.size(), 0, ArrayRef<mlir::AffineExpr> (placeholder_index_args),builder.getContext());
            
        // std::cout<<"number of "+std::to_string(placeholder_map.getNumDims())<<std::endl;
        mlir::ValueRange placeholder_vr=llvm::makeArrayRef(placeholder_index_values);
        
        ////////////////////////////////////////////////////////
        


        // mlir::ValueRange vr=llvm::makeArrayRef(values);
        // get the store location
        auto mem = funcs[0].getArgument(index_placeholder);
        argument_map.insert(std::pair(p_name,mem));

        // std::cout<<"hereee"<<std::endl;

        // dump_expression(polyfp_expr, argument_list,mem, funcs, flag2, level, dim_number,builder,ops,vr,false);
        if (polyfp_expr.get_expr_type() == polyfp::e_var)
        {    


            // if the expression is a variable(argument), get it from the function by its index
            int index_argument;
            std::string arg_name = polyfp_expr.get_name();
            for(int i=0; i<argument_list.size(); i++){

                if(argument_list.at(i) == arg_name){
                index_argument = i;
            }
            }
            auto arg_1 = funcs[0].getArgument(index_argument);

            // TODO, test all if cases
            if(if_flag == true){
                mlir::Value value = ops[2].getInductionVar();
                SmallVector<mlir::Value, 4> ifOperands;
                ifOperands.push_back(value);
                SmallVector<mlir::AffineExpr, 4> ifExprs;
                ifExprs.push_back(builder.getAffineDimExpr(0));
                SmallVector<bool, 4> ifEqFlags;
                ifEqFlags.push_back(true);
                const auto condition = mlir::IntegerSet::get(1, 0, ifExprs, ifEqFlags);
                
                auto ifOp =
                    builder.create<mlir::AffineIfOp>(builder.getUnknownLoc(), condition, ifOperands,
                                                /*withElseRegion=*/false);
                builder.setInsertionPointToStart(ifOp.getBody());
                auto store1 = builder.create<mlir::AffineStoreOp>(builder.getUnknownLoc(), arg_1, mem, placeholder_vr);
                builder.setInsertionPointAfter(ifOp);

            }else{
                if(placeholder_index_flag == true){

                    
                    auto store1 = builder.create<mlir::AffineStoreOp>(builder.getUnknownLoc(), arg_1, mem, placeholder_map, placeholder_vr);
                    builder.setInsertionPointAfter(store1);
                    // theModule.dump();
                }else{

                    auto store1 = builder.create<mlir::AffineStoreOp>(builder.getUnknownLoc(), arg_1, mem, placeholder_vr);
                    builder.setInsertionPointAfter(store1);
                    // theModule.dump();

                }
                
                // auto store1 = builder.create<mlir::AffineStoreOp>(builder.getUnknownLoc(), arg, mem, vr);
            }
          
            

            // if(level != dim_number-1){
            //     if(flag2 = false)
            //         builder.setInsertionPointAfter(store1);
            //     if(flag2 = true)
            //         builder.setInsertionPointAfter(ops[level]);
            // }
          
        }
        // binay operations
        else if (polyfp_expr.get_expr_type() == polyfp::e_op && polyfp_expr.get_op_type() != polyfp::o_access )
        {            
            std::cout<<"We get a e_op here"<<std::endl;
            mlir::ValueRange indices = {};
            auto a = polyfp_expr.get_operand(0);
            auto b = polyfp_expr.get_operand(1);

            mlir::BlockArgument left;
            mlir::BlockArgument right;

            mlir::arith::MulFOp allocSize_m;
            mlir::arith::AddFOp allocSize_a;

            // operation op ;
            a_print_expr(polyfp_expr, comp);
            // std::cout<<"We get a e_op1 here"<<std::endl;
            // theModule.dump();

            if(if_flag == true){
                // std::cout<<"We come to this place11"<<std::endl;
                mlir::Value value = ops[2].getInductionVar();
                SmallVector<mlir::Value, 4> ifOperands;
                ifOperands.push_back(value);
                SmallVector<mlir::AffineExpr, 4> ifExprs;
                ifExprs.push_back(builder.getAffineDimExpr(0));
                SmallVector<bool, 4> ifEqFlags;
                ifEqFlags.push_back(true);
                const auto condition = mlir::IntegerSet::get(1, 0, ifExprs, ifEqFlags);
                
                auto ifOp =
                    builder.create<mlir::AffineIfOp>(builder.getUnknownLoc(), condition, ifOperands,
                                                /*withElseRegion=*/false);
                builder.setInsertionPointToStart(ifOp.getBody());
                //TODO: other arithmetic? sub, o_div
                if(polyfp_expr.get_op_type() == polyfp::o_add){
                    auto store1 = builder.create<mlir::AffineStoreOp>(builder.getUnknownLoc(), all_add_op.back(), mem, placeholder_vr);

                }
                if(polyfp_expr.get_op_type() == polyfp::o_mul){
                    if(all_mul_op.size() == 0){
                        auto store1 = builder.create<mlir::AffineStoreOp>(builder.getUnknownLoc(), all_add_op.back(), mem, placeholder_vr);
                    }else{
                        auto store1 = builder.create<mlir::AffineStoreOp>(builder.getUnknownLoc(), all_mul_op.back(), mem, placeholder_vr);
                    }
                    

                }
                builder.setInsertionPointAfter(ifOp);

            }else{
                theModule.dump();
                std::cout<<"We come to this place1"<<std::endl;
                if(polyfp_expr.get_op_type() == polyfp::o_add){
                    std::cout<<"We come to this place2"<<std::endl;
                    if(placeholder_index_flag == true){
                        auto store1 = builder.create<mlir::AffineStoreOp>(builder.getUnknownLoc(), all_add_op.back(), mem, placeholder_map, placeholder_vr);
                        // theModule.dump();
                    }else{
                        auto store1 = builder.create<mlir::AffineStoreOp>(builder.getUnknownLoc(), all_add_op.back(), mem, placeholder_vr);

                    }
                    
                }
                if(polyfp_expr.get_op_type() == polyfp::o_mul){
                    theModule.dump();
                    std::cout<<"We come to this place2"<<std::endl;
                    if(placeholder_index_flag == true){
                        std::cout<<"We come to this place3"<<std::endl;
                        auto store1 = builder.create<mlir::AffineStoreOp>(builder.getUnknownLoc(), all_mul_op.back(), mem, placeholder_map, placeholder_vr);
                        // theModule.dump();
                    }else{
                            std::cout<<"number of "+std::to_string(placeholder_vr.size())<<std::endl;
                        // if(all_mul_op.size() == 0){
                            std::cout<<"We come to this place4"<<std::endl;
                            auto store1 = builder.create<mlir::AffineStoreOp>(builder.getUnknownLoc(), all_add_op.back(), mem, placeholder_vr);
                            std::cout<<"We come to this place4"<<std::endl;
                            theModule.dump();
                        // }
                        

                    }

                }
            }
            
            



        }else if(polyfp_expr.get_expr_type() == polyfp::e_op && polyfp_expr.get_op_type() == polyfp::o_access ){

            // std::cout<<"We get a e_op access here"<<std::endl;
            std::string a_name = polyfp_expr.get_name();
            int index_a;
            for(int i=0; i<argument_list.size(); i++){
                if(argument_list.at(i) == a_name)
                    index_a = i;               
            }
            auto arg_a = funcs[0].getArgument(index_a);

            std::vector<mlir::Value> index_values;
            SmallVector<mlir::AffineExpr> index_args;
            
            bool index_flag = false;
            int count = 0;
            for (auto &kv: polyfp_expr.get_access()){
                int bias = 0;
                if(kv.get_expr_type() == polyfp::e_op){
                    auto expr0 = kv.get_operand(0);
                    auto expr1 = kv.get_operand(1);
                    auto left_index = a_print_index(expr0,comp,index_values);
                    auto right_index = a_print_index(expr1,comp,index_values);

                    
                
                
                    // auto expr0 = kv.get_operand(0);
                    // auto expr1 = kv.get_operand(1);
                    int loc =  0;
                    if(kv.get_op_type() == polyfp::o_sub){
                        // std::cout<<"enter sub node"<<std::endl;
                        index_args.push_back(left_index - right_index);

                        index_flag = true;

                    }else if(kv.get_op_type() == polyfp::o_add){
                        index_args.push_back(left_index + right_index);
                        index_flag = true;
                        
                    }else if(kv.get_op_type() == polyfp::o_mul){
                        index_args.push_back(left_index * right_index);
                        index_flag = true;
                        
                    }else if(kv.get_op_type() == polyfp::o_div){
                        index_args.push_back(left_index.floorDiv(right_index));
                        index_flag = true;
                        
                    }


                }
                else{
                    int loc =0;
                    int loc_2 =0;
                    std::string tile_name1;
                    std::string tile_name2;
                    int tile_size;
                    auto name_set = comp->get_loop_level_names();

                    
                    if ( std::find(name_set.begin(), name_set.end(), kv.get_name()) == name_set.end() ){
                        // std::cout<<"else thereo1"<<std::endl;
                        for (auto &kv2: comp->get_access_map()){
                            if(kv.get_name()==kv2.first){
                                // std::cout<<"the name of the iterator:"<<std::endl;
                                // std::cout<<kv.get_name()<<std::endl;
                                tile_name1 = kv2.second;
                                // std::cout<<"the name of the iterator2:"<<std::endl;
                                // std::cout<<tile_name1<<std::endl;
                                loc = comp->get_loop_level_number_from_dimension_name(kv2.second);

                                // std::cout<<"location of it:"+std::to_string(loc)<<std::endl;
                            }
                        }
                        mlir::Value value = ops[loc].getInductionVar();
                        
                        if ( std::find(index_values.begin(), index_values.end(), value)== index_values.end() ){
                            // std::cout<<"dimension"+std::to_string(loc)<<std::endl;
                            index_values.push_back(value);
                        }
                        if(comp->is_tiled ==true){
                            for (auto &kv3: comp->get_tile_map()){
                            if(tile_name1==kv3.first){
                                // std::cout<<"else there03"<<std::endl;
                                loc_2 = comp->get_loop_level_number_from_dimension_name(kv3.second);
                                tile_name2 = kv3.second;

                                // std::cout<<"location of 03:"+std::to_string(comp->get_loop_level_number_from_dimension_name(kv3.second))<<std::endl;
                            }
                            }
                            for (auto &kv4: comp->get_tile_size_map()){
                                if(tile_name1==kv4.first){
                                    // std::cout<<"else there03"<<std::endl;
                                    tile_size = kv4.second;
                                }
                            }
                            mlir::Value value2 = ops[loc_2].getInductionVar();
                        
                            if ( std::find(index_values.begin(), index_values.end(), value2)== index_values.end() ){
                                // std::cout<<"dimension"+std::to_string(loc_2)<<std::endl;
                                index_values.push_back(value2);
                            }
                            int index_2 = std::find(index_values.begin(), index_values.end(), value2) - index_values.begin();
                            int index = std::find(index_values.begin(), index_values.end(), value) - index_values.begin();
                            index_args.push_back(builder.getAffineDimExpr(index)+builder.getAffineDimExpr(index_2)*tile_size);
                            // index_args.push_back(builder.getAffineDimExpr(count)+builder.getAffineDimExpr(count+1)*tile_size);

                        }else{
                            index_args.push_back(builder.getAffineDimExpr(loc));
                        }

                        index_flag = true;
                        
                        
                        
                    }else{
                        loc = comp->get_loop_level_number_from_dimension_name(kv.get_name());

                        //zhe li location = 0
                        // std::cout<<"else there"<<std::endl;
                        // std::cout<<"the location is : "+std::to_string(comp->get_loop_level_number_from_dimension_name(kv2.second))<<std::endl;
                        
                        mlir::Value value = ops[comp->get_loop_level_number_from_dimension_name(kv.get_name())].getInductionVar();
                        // std::cout<<"dimension"+std::to_string(comp->get_loop_level_number_from_dimension_name(kv.get_name()))<<std::endl;
                        if ( std::find(index_values.begin(), index_values.end(), value) == index_values.end()){
                            index_values.push_back(value);
                        }
                        int index = std::find(index_values.begin(), index_values.end(), value) - index_values.begin();
                        index_args.push_back(builder.getAffineDimExpr(index));
                    }
                
                    // std::cout<<"else there"<<std::endl;
                }
                
            }
            // mlir::Value value = ops[0].getInductionVar();
            // values.push_back(value);
            // mlir::Value value1 = ops[1].getInductionVar();
            // values.push_back(value1);
            // mlir::Value value1 = ops[1].getInductionVar();
            // values.push_back(value1);
            // std::cout<<"number of "+std::to_string(index_values.size())<<std::endl;
            // std::cout<<"number of "+std::to_string(index_args.size())<<std::endl;

            auto map = mlir::AffineMap::get(index_values.size(), 0, ArrayRef<mlir::AffineExpr> (index_args),builder.getContext());
            
            // std::cout<<"number of "+std::to_string(map.getNumDims())<<std::endl;
            // std::cout<<"number of "+std::to_string(map.getNumInputs())<<std::endl;
            mlir::ValueRange vr=llvm::makeArrayRef(index_values);
            //TODO.number of variables
            mlir::AffineLoadOp a;
            if(index_flag == true){
                a = builder.create<mlir::AffineLoadOp>(builder.getUnknownLoc(), arg_a,map,vr);
                // theModule.dump();
            }else{
                a = builder.create<mlir::AffineLoadOp>(builder.getUnknownLoc(), arg_a ,vr);
            }
                    
            // theModule.dump();

            if(if_flag == true){
                mlir::Value value = ops[2].getInductionVar();
                SmallVector<mlir::Value, 4> ifOperands;
                ifOperands.push_back(value);
                SmallVector<mlir::AffineExpr, 4> ifExprs;
                ifExprs.push_back(builder.getAffineDimExpr(0));
                SmallVector<bool, 4> ifEqFlags;
                ifEqFlags.push_back(true);
                const auto condition = mlir::IntegerSet::get(1, 0, ifExprs, ifEqFlags);
                
                auto ifOp =
                    builder.create<mlir::AffineIfOp>(builder.getUnknownLoc(), condition, ifOperands,
                                                /*withElseRegion=*/false);
                builder.setInsertionPointToStart(ifOp.getBody());
                auto store1 = builder.create<mlir::AffineStoreOp>(builder.getUnknownLoc(), a, mem, vr);
            
                builder.setInsertionPointAfter(ifOp);

            }else{
                // auto store1 = builder.create<mlir::AffineStoreOp>(builder.getUnknownLoc(), a, mem, vr);

                if(placeholder_index_flag == true){
                    auto store1 = builder.create<mlir::AffineStoreOp>(builder.getUnknownLoc(), a, mem, placeholder_map, placeholder_vr);
                    // theModule.dump();
                }else{
                    auto store1 = builder.create<mlir::AffineStoreOp>(builder.getUnknownLoc(), a, mem, placeholder_vr);

                }
            
            }
            

        }
       
        



    }else if (isl_ast_node_get_type(node) == isl_ast_node_if)
    {
        // std::cout<<"enter a if node"<<std::endl;
        isl_ast_expr *cond = isl_ast_node_if_get_cond(node);
        isl_ast_node *if_stmt = isl_ast_node_if_get_then(node);
        isl_ast_node *else_stmt = isl_ast_node_if_get_else(node);
        mlirGen1(fct,if_stmt,level,false,true,true);
        // MLIRGenImpl::AffineLoopBand tiledBand;
        //             MLIRGenImpl::TileList tileList;
        //             tileList.push_back(4);
        //             tilePerfectlyNested(ops[1], tileList);

  
        

        // if ((isl_ast_node_get_type(if_stmt) == isl_ast_node_user))
        // {
        //     std::cout<<"enter a if node111111"<<std::endl;
        // }else{
        //     std::cout<<"enter a if node222222"<<std::endl;
        // }
    }
    return theModule;
}
int polyfp::MLIRGenImpl::get_iterator_location_from_name(polyfp::compute *comp, polyfp::expr polyfp_expr, std::vector<mlir::Value> &index_values){
    auto name_set = comp->get_loop_level_names();
    int loc;
    if (std::find(name_set.begin(), name_set.end(), polyfp_expr.get_name()) == name_set.end() ){
        
        for (auto &kv2: comp->get_access_map()){
            if(polyfp_expr.get_name()==kv2.first){
                loc = comp->get_loop_level_number_from_dimension_name(kv2.second);
                
            }
        }
        mlir::Value value = ops[loc].getInductionVar();
        // std::cout<<"dimensions"+std::to_string(loc)<<std::endl;
        if ( std::find(index_values.begin(), index_values.end(), value) == index_values.end()){
            index_values.push_back(value);
        }

        loc = std::find(index_values.begin(), index_values.end(), value) - index_values.begin();
        
        


    }else{
        loc = comp->get_loop_level_number_from_dimension_name(polyfp_expr.get_name());
        mlir::Value value = ops[loc].getInductionVar();
        // std::cout<<"dimension"+std::to_string(loc)<<std::endl;
        if ( std::find(index_values.begin(), index_values.end(), value) == index_values.end()){
            index_values.push_back(value);
        }
        loc = std::find(index_values.begin(), index_values.end(), value) - index_values.begin();
    }
    return loc;


}

mlir::AffineExpr polyfp::MLIRGenImpl::a_print_index(polyfp::expr polyfp_expr, polyfp::compute *comp, std::vector<mlir::Value> &index_values){
    mlir::AffineExpr index_value;
    // auto expr0 = kv.get_operand(0);
    // auto expr1 = kv.get_operand(1);
    int loc =  0;
    if (polyfp_expr.get_expr_type() == polyfp::e_op)
    { 
        auto expr0 = polyfp_expr.get_operand(0);
        auto expr1 = polyfp_expr.get_operand(1);
        auto left_index = a_print_index(expr0,comp,index_values);
        auto right_index = a_print_index(expr1,comp, index_values);

        if(polyfp_expr.get_op_type() == polyfp::o_sub){
            index_value = left_index - right_index;

        }else if(polyfp_expr.get_op_type() == polyfp::o_add){
            index_value = left_index + right_index;
            
        }else if(polyfp_expr.get_op_type() == polyfp::o_mul){
            index_value = left_index * right_index;
        }else if(polyfp_expr.get_op_type() == polyfp::o_div){
            index_value = left_index.floorDiv(right_index);
            
        }

        
      
    }
    if (polyfp_expr.get_expr_type() == polyfp::e_var)
    {   
        loc = get_iterator_location_from_name(comp,polyfp_expr,index_values);
        auto name_set = comp->get_loop_level_names();
        if(comp->is_tiled == true&&std::find(name_set.begin(), name_set.end(), polyfp_expr.get_name()) == name_set.end()){
            int loc_2 =0;
            std::string tile_name1;
            std::string tile_name2;
            int tile_size;

            if(comp->is_tiled ==true){
                for (auto &kv2: comp->get_access_map()){
                    if(polyfp_expr.get_name()==kv2.first){
                        tile_name1 = kv2.second;
                    }
                }
                for (auto &kv3: comp->get_tile_map()){
                    if(tile_name1==kv3.first){
                        loc_2 = comp->get_loop_level_number_from_dimension_name(kv3.second);
                        tile_name2 = kv3.second;
                    }
                }
                for (auto &kv4: comp->get_tile_size_map()){
                    if(tile_name1==kv4.first){
                        tile_size = kv4.second;
                        // std::cout<<tile_size<<std::endl;
                    }
                }
                mlir::Value value2 = ops[loc_2].getInductionVar();
                if ( std::find(index_values.begin(), index_values.end(), value2) == index_values.end()){
                    index_values.push_back(value2);
                }
                // int index = std::find(index_values.begin(), index_values.end(), value) - index_values.begin();
                int index2 = std::find(index_values.begin(), index_values.end(), value2) - index_values.begin();
                index_value = builder.getAffineDimExpr(loc)+builder.getAffineDimExpr(index2)*tile_size;
            }

            
        }else{
            index_value = builder.getAffineDimExpr(loc);
        }
        

    }  
    if (polyfp_expr.get_expr_type() == polyfp::e_val)
    {
        index_value = getAffineConstantExpr(polyfp_expr.get_int_val(),builder.getContext());
    }  
    // index_value = builder.getAffineDimExpr(loc%2);
    
    return index_value;

}

void polyfp::MLIRGenImpl::a_print_expr(polyfp::expr polyfp_expr, polyfp::compute *comp){
    auto left = polyfp_expr.get_operand(0);
    auto right = polyfp_expr.get_operand(1);
    if ((right.get_op_type() == polyfp::o_access || right.get_expr_type() == polyfp::e_var ) && (left.get_op_type() == polyfp::o_access || left.get_expr_type() == polyfp::e_var)){
        mlir::AffineLoadOp loadedRhs;
        mlir::AffineLoadOp loadedLhs;
        mlir::BlockArgument arg_left;
        mlir::BlockArgument arg_right;
        // std::cout<<"round FIRST "<<std::endl;
        if(left.get_op_type() == polyfp::o_access){
            // std::cout<<"round FIRST access"<<std::endl;
            std::string a_name = left.get_name();
            int index_a;
            for(int i=0; i<argument_list.size(); i++){
                if(argument_list.at(i) == a_name)
                    index_a = i;               
            }
            auto arg_a = funcs[0].getArgument(index_a);

            std::vector<mlir::Value> index_values;
            SmallVector<mlir::AffineExpr> index_args;
            
            bool index_flag = false;
            for (auto &kv: left.get_access()){
                int bias = 0;
                // std::cout<<"round"<<std::endl;

                 if(kv.get_expr_type() == polyfp::e_op){
                    auto expr0 = kv.get_operand(0);
                    auto expr1 = kv.get_operand(1);
                    auto left_index = a_print_index(expr0,comp,index_values);
                    auto right_index = a_print_index(expr1,comp,index_values);

                    
                
                
                    // auto expr0 = kv.get_operand(0);
                    // auto expr1 = kv.get_operand(1);
                    int loc =  0;
                    if(kv.get_op_type() == polyfp::o_sub){
                        index_args.push_back(left_index - right_index);
                        index_flag = true;

                    }else if(kv.get_op_type() == polyfp::o_add){
                        index_args.push_back(left_index + right_index);
                        index_flag = true;
                        
                    }else if(kv.get_op_type() == polyfp::o_mul){
                        index_args.push_back(left_index * right_index);
                        index_flag = true;
                        
                    }else if(kv.get_op_type() == polyfp::o_div){
                        index_args.push_back(left_index.floorDiv(right_index));
                        index_flag = true;
                        
                    }


                }

                else{
                    int loc =0;
                    int loc_2 =0;
                    std::string tile_name1;
                    std::string tile_name2;
                    int tile_size;
                    auto name_set = comp->get_loop_level_names();

                    
                    if ( std::find(name_set.begin(), name_set.end(), kv.get_name()) == name_set.end() ){
                        // std::cout<<"else thereo1"<<std::endl;
                        for (auto &kv2: comp->get_access_map()){
                            if(kv.get_name()==kv2.first){
                                // std::cout<<"the name of the iterator:"<<std::endl;
                                // std::cout<<kv.get_name()<<std::endl;
                                tile_name1 = kv2.second;
                                // std::cout<<"the name of the iterator2:"<<std::endl;
                                // std::cout<<tile_name1<<std::endl;
                                loc = comp->get_loop_level_number_from_dimension_name(kv2.second);

                                // std::cout<<"location of it:"+std::to_string(loc)<<std::endl;
                            }
                        }
                        mlir::Value value = ops[loc].getInductionVar();
                        
                        if ( std::find(index_values.begin(), index_values.end(), value)== index_values.end() ){
                            // std::cout<<"dimension"+std::to_string(loc)<<std::endl;
                            index_values.push_back(value);
                        }
                        if(comp->is_tiled ==true){
                            for (auto &kv3: comp->get_tile_map()){
                            if(tile_name1==kv3.first){
                                // std::cout<<"else there03"<<std::endl;
                                loc_2 = comp->get_loop_level_number_from_dimension_name(kv3.second);
                                tile_name2 = kv3.second;

                                // std::cout<<"location of 03:"+std::to_string(comp->get_loop_level_number_from_dimension_name(kv3.second))<<std::endl;
                            }
                            }
                            for (auto &kv4: comp->get_tile_size_map()){
                                if(tile_name1==kv4.first){
                                    // std::cout<<"else there03"<<std::endl;
                                    tile_size = kv4.second;
                                }
                            }
                            mlir::Value value2 = ops[loc_2].getInductionVar();
                        
                            if ( std::find(index_values.begin(), index_values.end(), value2)== index_values.end() ){
                                // std::cout<<"dimension"+std::to_string(loc_2)<<std::endl;
                                index_values.push_back(value2);
                            }
                            int index_2 = std::find(index_values.begin(), index_values.end(), value2) - index_values.begin();
                            int index = std::find(index_values.begin(), index_values.end(), value) - index_values.begin();
                            index_args.push_back(builder.getAffineDimExpr(index)+builder.getAffineDimExpr(index_2)*tile_size);
                            // index_args.push_back(builder.getAffineDimExpr(count)+builder.getAffineDimExpr(count+1)*tile_size);

                        }else{
                            index_args.push_back(builder.getAffineDimExpr(loc));
                        }

                        index_flag = true;
                        
                        
                        
                    }else{
                        loc = comp->get_loop_level_number_from_dimension_name(kv.get_name());

                        //zhe li location = 0
                        // std::cout<<"else there"<<std::endl;
                        // std::cout<<"the location is : "+std::to_string(comp->get_loop_level_number_from_dimension_name(kv2.second))<<std::endl;
                        
                        mlir::Value value = ops[comp->get_loop_level_number_from_dimension_name(kv.get_name())].getInductionVar();
                        // std::cout<<"dimension"+std::to_string(comp->get_loop_level_number_from_dimension_name(kv.get_name()))<<std::endl;
                        if ( std::find(index_values.begin(), index_values.end(), value) == index_values.end()){
                            index_values.push_back(value);
                        }
                        int index = std::find(index_values.begin(), index_values.end(), value) - index_values.begin();
                        index_args.push_back(builder.getAffineDimExpr(index));
                    }
                
                    // std::cout<<"else there"<<std::endl;
                }
                
            }
            // mlir::Value value = ops[0].getInductionVar();
            // values.push_back(value);
            // mlir::Value value1 = ops[1].getInductionVar();
            // values.push_back(value1);
            // mlir::Value value1 = ops[1].getInductionVar();
            // values.push_back(value1);
            // std::cout<<"number of "+std::to_string(index_values.size())<<std::endl;

            auto map = mlir::AffineMap::get(index_values.size(), 0, ArrayRef<mlir::AffineExpr> (index_args),builder.getContext());
            
            // std::cout<<"number of "+std::to_string(map.getNumDims())<<std::endl;
            mlir::ValueRange vr=llvm::makeArrayRef(index_values);
            //TODO.number of variables
            mlir::AffineLoadOp a;
            if(index_flag == true){
                loadedLhs = builder.create<mlir::AffineLoadOp>(builder.getUnknownLoc(), arg_a,map,vr);
                // theModule.dump();
            }else{
                loadedLhs = builder.create<mlir::AffineLoadOp>(builder.getUnknownLoc(), arg_a ,vr);
            }
            
            // theModule.dump();
            // std::cout<<"number of fisrt1"<<std::endl;

            
        }else if(left.get_expr_type() == polyfp::e_var){
            int index_argument;
            std::string arg_name = left.get_name();
            for(int i=0; i<argument_list.size(); i++){

                if(argument_list.at(i) == arg_name){
                    index_argument = i;
                }
            }
            arg_left = funcs[0].getArgument(index_argument);
        }

        if(right.get_op_type() == polyfp::o_access){
            
            std::string a_name = right.get_name();
            int index_a;
            for(int i=0; i<argument_list.size(); i++){
                if(argument_list.at(i) == a_name)
                    index_a = i;               
            }
            auto arg_a = funcs[0].getArgument(index_a);

            std::vector<mlir::Value> index_values;
            SmallVector<mlir::AffineExpr> index_args;
            
            bool index_flag = false;
            for (auto &kv: right.get_access()){
                int bias = 0;
                // std::cout<<"round"<<std::endl;
                if(kv.get_expr_type() == polyfp::e_op){
                    auto expr0 = kv.get_operand(0);
                    auto expr1 = kv.get_operand(1);
                    auto left_index = a_print_index(expr0,comp,index_values);
                    auto right_index = a_print_index(expr1,comp,index_values);

                    
                
                
                    // auto expr0 = kv.get_operand(0);
                    // auto expr1 = kv.get_operand(1);
                    int loc =  0;
                    if(kv.get_op_type() == polyfp::o_sub){
                        // std::cout<<"enter sub node"<<std::endl;
                        index_args.push_back(left_index - right_index);

                        // index_args.push_back(builder.getAffineDimExpr(0) + builder.getAffineDimExpr(1));
                        // std::cout<<"enter sub2 node"<<std::endl;
                        index_flag = true;

                    }else if(kv.get_op_type() == polyfp::o_add){
                        index_args.push_back(left_index + right_index);
                        index_flag = true;
                        
                    }else if(kv.get_op_type() == polyfp::o_mul){
                        index_args.push_back(left_index * right_index);
                        index_flag = true;
                        
                    }else if(kv.get_op_type() == polyfp::o_div){
                        index_args.push_back(left_index.floorDiv(right_index));
                        index_flag = true;
                        
                    }


                }
               else{
                    int loc =0;
                    int loc_2 =0;
                    std::string tile_name1;
                    std::string tile_name2;
                    int tile_size;
                    auto name_set = comp->get_loop_level_names();

                    
                    if ( std::find(name_set.begin(), name_set.end(), kv.get_name()) == name_set.end() ){
                        // std::cout<<"else thereo1"<<std::endl;
                        for (auto &kv2: comp->get_access_map()){
                            if(kv.get_name()==kv2.first){

                                tile_name1 = kv2.second;

                                loc = comp->get_loop_level_number_from_dimension_name(kv2.second);

                                // std::cout<<"location of it:"+std::to_string(loc)<<std::endl;
                            }
                        }
                        mlir::Value value = ops[loc].getInductionVar();
                        
                        if ( std::find(index_values.begin(), index_values.end(), value)== index_values.end() ){
                            // std::cout<<"dimension"+std::to_string(loc)<<std::endl;
                            index_values.push_back(value);
                        }
                        if(comp->is_tiled ==true){
                            for (auto &kv3: comp->get_tile_map()){
                            if(tile_name1==kv3.first){
  
                                loc_2 = comp->get_loop_level_number_from_dimension_name(kv3.second);
                                tile_name2 = kv3.second;

                                // std::cout<<"location of 03:"+std::to_string(comp->get_loop_level_number_from_dimension_name(kv3.second))<<std::endl;
                            }
                            }
                            for (auto &kv4: comp->get_tile_size_map()){
                                if(tile_name1==kv4.first){
                                    tile_size = kv4.second;
                                }
                            }
                            mlir::Value value2 = ops[loc_2].getInductionVar();
                        
                            if ( std::find(index_values.begin(), index_values.end(), value2)== index_values.end() ){
                                // std::cout<<"dimension"+std::to_string(loc_2)<<std::endl;
                                index_values.push_back(value2);
                            }
                            int index_2 = std::find(index_values.begin(), index_values.end(), value2) - index_values.begin();
                            int index = std::find(index_values.begin(), index_values.end(), value) - index_values.begin();
                            index_args.push_back(builder.getAffineDimExpr(index)+builder.getAffineDimExpr(index_2)*tile_size);
                            // index_args.push_back(builder.getAffineDimExpr(count)+builder.getAffineDimExpr(count+1)*tile_size);

                        }else{
                            index_args.push_back(builder.getAffineDimExpr(loc));
                        }

                        index_flag = true;
                        
                        
                        
                    }else{
                        loc = comp->get_loop_level_number_from_dimension_name(kv.get_name());

                        //zhe li location = 0
                        // std::cout<<"the location is : "+std::to_string(comp->get_loop_level_number_from_dimension_name(kv2.second))<<std::endl;
                        
                        mlir::Value value = ops[comp->get_loop_level_number_from_dimension_name(kv.get_name())].getInductionVar();
                        // std::cout<<"dimension"+std::to_string(comp->get_loop_level_number_from_dimension_name(kv.get_name()))<<std::endl;
                        if ( std::find(index_values.begin(), index_values.end(), value) == index_values.end()){
                            index_values.push_back(value);
                        }
                        int index = std::find(index_values.begin(), index_values.end(), value) - index_values.begin();
                        index_args.push_back(builder.getAffineDimExpr(index));
                    }
                
                    // std::cout<<"else there"<<std::endl;
                }
                
            }
            // mlir::Value value = ops[0].getInductionVar();
            // values.push_back(value);
            // mlir::Value value1 = ops[1].getInductionVar();
            // values.push_back(value1);
            // mlir::Value value1 = ops[1].getInductionVar();
            // values.push_back(value1);
            // std::cout<<"number of "+std::to_string(index_values.size())<<std::endl;

            auto map = mlir::AffineMap::get(index_values.size(), 0, ArrayRef<mlir::AffineExpr> (index_args),builder.getContext());
            
            // std::cout<<"number of "+std::to_string(map.getNumDims())<<std::endl;
            mlir::ValueRange vr=llvm::makeArrayRef(index_values);
            //TODO.number of variables
            mlir::AffineLoadOp a;
            if(index_flag == true){
                loadedRhs = builder.create<mlir::AffineLoadOp>(builder.getUnknownLoc(), arg_a,map,vr);
                // theModule.dump();
            }else{
                loadedRhs = builder.create<mlir::AffineLoadOp>(builder.getUnknownLoc(), arg_a ,vr);
            }
     
            // theModule.dump();
            // std::cout<<"number of fisrt2"<<std::endl;

            
        }else if(right.get_expr_type() == polyfp::e_var){
            int index_argument;
            std::string arg_name = right.get_name();
            for(int i=0; i<argument_list.size(); i++){

                if(argument_list.at(i) == arg_name){
                    index_argument = i;
                }
            }
            arg_right = funcs[0].getArgument(index_argument);
        }
        if (right.get_op_type() == polyfp::o_access && left.get_op_type() == polyfp::o_access ){
            if(polyfp_expr.get_op_type() == polyfp::o_add){
                auto add_1 = builder.create<mlir::arith::AddFOp>(builder.getUnknownLoc(), loadedLhs, loadedRhs);
                
                add_op.push_back(add_1);
                all_add_op.push_back(add_1);
            }
            if(polyfp_expr.get_op_type() == polyfp::o_mul){
                auto mul_1 = builder.create<mlir::arith::MulFOp>(builder.getUnknownLoc(), loadedLhs, loadedRhs);
                mul_op.push_back(mul_1);
                all_mul_op.push_back(mul_1);
                
            }
        }
        if (right.get_op_type() == polyfp::o_access  && left.get_expr_type() == polyfp::e_var){
            if(polyfp_expr.get_op_type() == polyfp::o_add){
                auto add_1 = builder.create<mlir::arith::AddFOp>(builder.getUnknownLoc(), arg_left, loadedRhs);
                add_op.push_back(add_1);
                all_add_op.push_back(add_1);
            }
            if(polyfp_expr.get_op_type() == polyfp::o_mul){
                auto mul_1 = builder.create<mlir::arith::MulFOp>(builder.getUnknownLoc(), arg_left, loadedRhs);
                mul_op.push_back(mul_1);
                all_mul_op.push_back(mul_1);
            }
        }
        if (left.get_op_type() == polyfp::o_access  && right.get_expr_type() == polyfp::e_var){
            if(polyfp_expr.get_op_type() == polyfp::o_add){
                auto add_1 = builder.create<mlir::arith::AddFOp>(builder.getUnknownLoc(), loadedLhs, arg_right);
                add_op.push_back(add_1);
                all_add_op.push_back(add_1);
            }
            if(polyfp_expr.get_op_type() == polyfp::o_mul){
                auto mul_1 = builder.create<mlir::arith::MulFOp>(builder.getUnknownLoc(), loadedLhs, arg_right);
                mul_op.push_back(mul_1);
                all_mul_op.push_back(mul_1);
            }
        }
        if (left.get_expr_type() == polyfp::e_var  && right.get_expr_type() == polyfp::e_var){
            if(polyfp_expr.get_op_type() == polyfp::o_add){
                auto add_1 = builder.create<mlir::arith::AddFOp>(builder.getUnknownLoc(), arg_left, arg_right);
                add_op.push_back(add_1);
                all_add_op.push_back(add_1);
            }
            if(polyfp_expr.get_op_type() == polyfp::o_mul){
                auto mul_1 = builder.create<mlir::arith::MulFOp>(builder.getUnknownLoc(), arg_left, arg_right);
                mul_op.push_back(mul_1);
                all_mul_op.push_back(mul_1);
            }
        }
        // std::cout<<"finish number of fisrt2"<<std::endl;
    }
       
    if ((right.get_op_type() == polyfp::o_access || right.get_expr_type() == polyfp::e_var ) && (left.get_op_type() != polyfp::o_access && left.get_expr_type() == polyfp::e_op)){
        mlir::AffineLoadOp loadedRhs;
        // std::cout<<"round second "<<std::endl;
        a_print_expr(left,comp);
        // std::cout<<"round second finished"<<std::endl;


        if(right.get_op_type() == polyfp::o_access){
            std::string a_name = right.get_name();
            int index_a;
            for(int i=0; i<argument_list.size(); i++){
                if(argument_list.at(i) == a_name)
                    index_a = i;               
            }
            auto arg_a = funcs[0].getArgument(index_a);

             std::vector<mlir::Value> index_values;
            SmallVector<mlir::AffineExpr> index_args;
            
            bool index_flag = false;
            for (auto &kv: right.get_access()){
                int bias = 0;
                if(kv.get_expr_type() == polyfp::e_op){
                    auto expr0 = kv.get_operand(0);
                    auto expr1 = kv.get_operand(1);
                    auto left_index = a_print_index(expr0,comp,index_values);
                    auto right_index = a_print_index(expr1,comp,index_values);

                    
                
                
                    // auto expr0 = kv.get_operand(0);
                    // auto expr1 = kv.get_operand(1);
                    int loc =  0;
                    if(kv.get_op_type() == polyfp::o_sub){
                       
                        index_args.push_back(left_index - right_index);

                        // index_args.push_back(builder.getAffineDimExpr(0) + builder.getAffineDimExpr(1));
                        
                        index_flag = true;

                    }else if(kv.get_op_type() == polyfp::o_add){
                        index_args.push_back(left_index + right_index);
                        index_flag = true;
                        
                    }else if(kv.get_op_type() == polyfp::o_mul){
                        index_args.push_back(left_index * right_index);
                        index_flag = true;
                        
                    }else if(kv.get_op_type() == polyfp::o_div){
                        index_args.push_back(left_index.floorDiv(right_index));
                        index_flag = true;
                        
                    }


                }
                else{
                    int loc =0;
                    int loc_2 =0;
                    std::string tile_name1;
                    std::string tile_name2;
                    int tile_size;
                    auto name_set = comp->get_loop_level_names();

                    
                    if ( std::find(name_set.begin(), name_set.end(), kv.get_name()) == name_set.end() ){
                        
                        for (auto &kv2: comp->get_access_map()){
                            if(kv.get_name()==kv2.first){
                                
                                tile_name1 = kv2.second;
                                
                                loc = comp->get_loop_level_number_from_dimension_name(kv2.second);

                                
                            }
                        }
                        mlir::Value value = ops[loc].getInductionVar();
                        
                        if ( std::find(index_values.begin(), index_values.end(), value)== index_values.end() ){
                            
                            index_values.push_back(value);
                        }
                        if(comp->is_tiled ==true){
                            for (auto &kv3: comp->get_tile_map()){
                            if(tile_name1==kv3.first){
                                
                                loc_2 = comp->get_loop_level_number_from_dimension_name(kv3.second);
                                tile_name2 = kv3.second;

                                
                            }
                            }
                            for (auto &kv4: comp->get_tile_size_map()){
                                if(tile_name1==kv4.first){
                                    
                                    tile_size = kv4.second;
                                }
                            }
                            mlir::Value value2 = ops[loc_2].getInductionVar();
                        
                            if ( std::find(index_values.begin(), index_values.end(), value2)== index_values.end() ){
                                
                                index_values.push_back(value2);
                            }
                            int index_2 = std::find(index_values.begin(), index_values.end(), value2) - index_values.begin();
                            int index = std::find(index_values.begin(), index_values.end(), value) - index_values.begin();
                            index_args.push_back(builder.getAffineDimExpr(index)+builder.getAffineDimExpr(index_2)*tile_size);
                            // index_args.push_back(builder.getAffineDimExpr(count)+builder.getAffineDimExpr(count+1)*tile_size);

                        }else{
                            index_args.push_back(builder.getAffineDimExpr(loc));
                        }

                        index_flag = true;
                        
                        
                        
                    }else{
                        loc = comp->get_loop_level_number_from_dimension_name(kv.get_name());

                        //zhe li location = 0
                        
                        // std::cout<<"the location is : "+std::to_string(comp->get_loop_level_number_from_dimension_name(kv2.second))<<std::endl;
                        
                        mlir::Value value = ops[comp->get_loop_level_number_from_dimension_name(kv.get_name())].getInductionVar();
                        
                        if ( std::find(index_values.begin(), index_values.end(), value) == index_values.end()){
                            index_values.push_back(value);
                        }
                        int index = std::find(index_values.begin(), index_values.end(), value) - index_values.begin();
                        index_args.push_back(builder.getAffineDimExpr(index));
                    }
                
                    // std::cout<<"else there"<<std::endl;
                }
                
            }
            // mlir::Value value = ops[0].getInductionVar();
            // values.push_back(value);
            // mlir::Value value1 = ops[1].getInductionVar();
            // values.push_back(value1);
            // mlir::Value value1 = ops[1].getInductionVar();
            // values.push_back(value1);
            

            auto map = mlir::AffineMap::get(index_values.size(), 0, ArrayRef<mlir::AffineExpr> (index_args),builder.getContext());
            
            
            mlir::ValueRange vr=llvm::makeArrayRef(index_values);
            //TODO.number of variables
            mlir::AffineLoadOp a;
            if(index_flag == true){
                loadedRhs = builder.create<mlir::AffineLoadOp>(builder.getUnknownLoc(), arg_a,map,vr);
                // theModule.dump();
            }else{
                loadedRhs = builder.create<mlir::AffineLoadOp>(builder.getUnknownLoc(), arg_a ,vr);
            }
            // theModule.dump();
            //  std::cout<<"else there"<<std::endl;
            // std::vector<mlir::Value> values;
            // for (auto &kv: right.get_access()){
            //     mlir::Value value = ops[comp->get_loop_level_number_from_dimension_name(kv.get_name())].getInductionVar();
            //     values.push_back(value);
            // }
            // mlir::ValueRange vr=llvm::makeArrayRef(values);

            // loadedRhs = builder.create<mlir::AffineLoadOp>(builder.getUnknownLoc(), arg_a,vr);

            
            if(polyfp_expr.get_op_type() == polyfp::o_add){
                // std::cout<<"else there!!!"<<std::endl;
                auto add_1 = builder.create<mlir::arith::AddFOp>(builder.getUnknownLoc(), loadedRhs, add_op.back());
                all_add_op.push_back(add_1);
            }
            if(polyfp_expr.get_op_type() == polyfp::o_mul){
                // std::cout<<"else there"<<std::endl;
                auto mul_1 = builder.create<mlir::arith::MulFOp>(builder.getUnknownLoc(), loadedRhs, mul_op.back());
                all_mul_op.push_back(mul_1);
            }
            // theModule.dump();
        }
        if(right.get_expr_type() == polyfp::e_var){
            // std::cout<<"else there###########"<<std::endl;
            int index_argument;
            std::string arg_name = right.get_name();
            // std::cout<<arg_name<<std::endl;
            for(int i=0; i<argument_list.size(); i++){

                if(argument_list.at(i) == arg_name){
                    index_argument = i;
                }
            }
            
            auto arg_right = funcs[0].getArgument(index_argument);
            // loadedRhs = builder.create<mlir::AffineLoadOp>(builder.getUnknownLoc(), arg_a ,vr);
            

            
            if(polyfp_expr.get_op_type() == polyfp::o_add){
                auto add_1 = builder.create<mlir::arith::AddFOp>(builder.getUnknownLoc(), add_op.back(),arg_right);
                all_add_op.push_back(add_1);
            }
            if(polyfp_expr.get_op_type() == polyfp::o_mul){

                
                if(add_op.size() == 1){
                    auto mul_1 = builder.create<mlir::arith::MulFOp>(builder.getUnknownLoc(), add_op.back(),arg_right);
                    all_mul_op.push_back(mul_1);

                }else{
                    auto mul_1 = builder.create<mlir::arith::MulFOp>(builder.getUnknownLoc(), mul_op.back(),arg_right);
                    all_mul_op.push_back(mul_1);
                }
                
                // std::cout<<"else there###########1"<<std::endl;
                
            }
        }
        // theModule.dump();
        
    }
    if ((left.get_op_type() == polyfp::o_access || left.get_expr_type() == polyfp::e_var ) && (right.get_op_type() != polyfp::o_access && right.get_expr_type() == polyfp::e_op)){
        mlir::AffineLoadOp loadedLhs;
        // std::cout<<"round third "<<std::endl;

        a_print_expr(right,comp);
        


        if(left.get_op_type() == polyfp::o_access){
            std::string a_name = left.get_name();
            int index_a;
            for(int i=0; i<argument_list.size(); i++){
                if(argument_list.at(i) == a_name)
                    index_a = i;               
            }
            auto arg_a = funcs[0].getArgument(index_a);
            std::vector<mlir::Value> index_values;
            SmallVector<mlir::AffineExpr> index_args;
            
            
            bool index_flag = false;
            for (auto &kv: left.get_access()){
                int bias = 0;
                if(kv.get_expr_type() == polyfp::e_op){
                    auto expr0 = kv.get_operand(0);
                    auto expr1 = kv.get_operand(1);
                    
                    auto left_index = a_print_index(expr0,comp,index_values);
                    auto right_index = a_print_index(expr1,comp,index_values);
                    

                    
                
                
                    // auto expr0 = kv.get_operand(0);
                    // auto expr1 = kv.get_operand(1);
                    int loc =  0;
                    if(kv.get_op_type() == polyfp::o_sub){
                        
                        index_args.push_back(left_index - right_index);


                        index_flag = true;

                    }else if(kv.get_op_type() == polyfp::o_add){
                        index_args.push_back(left_index + right_index);
                        index_flag = true;
                        
                    }else if(kv.get_op_type() == polyfp::o_mul){
                        index_args.push_back(left_index * right_index);
                        index_flag = true;
                        
                    }else if(kv.get_op_type() == polyfp::o_div){
                        index_args.push_back(left_index.floorDiv(right_index));
                        index_flag = true;
                        
                    }


                }
                else{
                    int loc =0;
                    int loc_2 =0;
                    std::string tile_name1;
                    std::string tile_name2;
                    int tile_size;
                    auto name_set = comp->get_loop_level_names();

                    
                    if ( std::find(name_set.begin(), name_set.end(), kv.get_name()) == name_set.end() ){
                        
                        for (auto &kv2: comp->get_access_map()){
                            if(kv.get_name()==kv2.first){

                                tile_name1 = kv2.second;

                                loc = comp->get_loop_level_number_from_dimension_name(kv2.second);

                            }
                        }
                        mlir::Value value = ops[loc].getInductionVar();
                        
                        if ( std::find(index_values.begin(), index_values.end(), value)== index_values.end() ){
                            index_values.push_back(value);
                        }
                        if(comp->is_tiled ==true){
                            for (auto &kv3: comp->get_tile_map()){
                            if(tile_name1==kv3.first){
                                loc_2 = comp->get_loop_level_number_from_dimension_name(kv3.second);
                                tile_name2 = kv3.second;

                            }
                            }
                            for (auto &kv4: comp->get_tile_size_map()){
                                if(tile_name1==kv4.first){
                                    
                                    tile_size = kv4.second;
                                }
                            }
                            mlir::Value value2 = ops[loc_2].getInductionVar();
                        
                            if ( std::find(index_values.begin(), index_values.end(), value2)== index_values.end() ){
                                index_values.push_back(value2);
                            }
                            int index_2 = std::find(index_values.begin(), index_values.end(), value2) - index_values.begin();
                            int index = std::find(index_values.begin(), index_values.end(), value) - index_values.begin();
                            index_args.push_back(builder.getAffineDimExpr(index)+builder.getAffineDimExpr(index_2)*tile_size);
                            // index_args.push_back(builder.getAffineDimExpr(count)+builder.getAffineDimExpr(count+1)*tile_size);

                        }else{
                            index_args.push_back(builder.getAffineDimExpr(loc));
                        }

                        index_flag = true;
                        
                        
                        
                    }else{
                        loc = comp->get_loop_level_number_from_dimension_name(kv.get_name());

                        //zhe li location = 0
                        // std::cout<<"the location is : "+std::to_string(comp->get_loop_level_number_from_dimension_name(kv2.second))<<std::endl;
                        
                        mlir::Value value = ops[comp->get_loop_level_number_from_dimension_name(kv.get_name())].getInductionVar();
                        if ( std::find(index_values.begin(), index_values.end(), value) == index_values.end()){
                            index_values.push_back(value);
                        }
                        int index = std::find(index_values.begin(), index_values.end(), value) - index_values.begin();
                        index_args.push_back(builder.getAffineDimExpr(index));
                    }
                
                    // std::cout<<"else there"<<std::endl;
                }
                
            }
            // mlir::Value value = ops[0].getInductionVar();
            // values.push_back(value);
            // mlir::Value value1 = ops[1].getInductionVar();
            // values.push_back(value1);
            // mlir::Value value1 = ops[1].getInductionVar();
            // values.push_back(value1);


            auto map = mlir::AffineMap::get(index_values.size(), 0, ArrayRef<mlir::AffineExpr> (index_args),builder.getContext());
            

            mlir::ValueRange vr=llvm::makeArrayRef(index_values);
            //TODO.number of variables
            mlir::AffineLoadOp a;
            if(index_flag == true){
                loadedLhs = builder.create<mlir::AffineLoadOp>(builder.getUnknownLoc(), arg_a,map,vr);
                // theModule.dump();
            }else{
                loadedLhs = builder.create<mlir::AffineLoadOp>(builder.getUnknownLoc(), arg_a ,vr);
            }

            // std::vector<mlir::Value> values;
            // for (auto &kv: left.get_access()){
            //     mlir::Value value = ops[comp->get_loop_level_number_from_dimension_name(kv.get_name())].getInductionVar();
            //     values.push_back(value);
            // }
            // mlir::ValueRange vr=llvm::makeArrayRef(values);

            // loadedLhs = builder.create<mlir::AffineLoadOp>(builder.getUnknownLoc(), arg_a,vr);

            // theModule.dump();
            if(polyfp_expr.get_op_type() == polyfp::o_add){
                if(add_op.size()==0){
                    auto add_1 = builder.create<mlir::arith::AddFOp>(builder.getUnknownLoc(), mul_op.back(), loadedLhs);
                    all_add_op.push_back(add_1);
                }else{
                    auto add_1 = builder.create<mlir::arith::AddFOp>(builder.getUnknownLoc(), add_op.back(), loadedLhs);
                    all_add_op.push_back(add_1);
                }
                
               
            }
            if(polyfp_expr.get_op_type() == polyfp::o_mul){
                if(mul_op.size()==0){
                    auto mul_1 = builder.create<mlir::arith::MulFOp>(builder.getUnknownLoc(), add_op.back(), loadedLhs);
                    all_mul_op.push_back(mul_1);
                }else{
                    auto mul_1 = builder.create<mlir::arith::MulFOp>(builder.getUnknownLoc(), mul_op.back(), loadedLhs);
                    all_mul_op.push_back(mul_1);
                }
                
                // auto mul_1 = builder.create<mlir::arith::MulFOp>(builder.getUnknownLoc(), mul_op.back(), loadedLhs);
                // all_mul_op.push_back(mul_1);
            }
        }
        if(left.get_expr_type() == polyfp::e_var){
            int index_argument;
            std::string arg_name = left.get_name();
            for(int i=0; i<argument_list.size(); i++){

                if(argument_list.at(i) == arg_name){
                    index_argument = i;
                }
            }
            auto arg_left = funcs[0].getArgument(index_argument);

            
            if(polyfp_expr.get_op_type() == polyfp::o_add){
                auto add_1 = builder.create<mlir::arith::AddFOp>(builder.getUnknownLoc(), arg_left, add_op.back());
                all_add_op.push_back(add_1);
            }
            if(polyfp_expr.get_op_type() == polyfp::o_mul){
                auto mul_1 = builder.create<mlir::arith::MulFOp>(builder.getUnknownLoc(), arg_left, mul_op.back());
                all_mul_op.push_back(mul_1);
            }
        }
        
    }
    if ((left.get_op_type() != polyfp::o_access && left.get_expr_type() == polyfp::e_op) && (right.get_op_type() != polyfp::o_access && right.get_expr_type() == polyfp::e_op)){
        mlir::AffineLoadOp loadedLhs;
        // std::cout<<"round forth "<<std::endl;

        a_print_expr(left,comp);
        a_print_expr(right,comp);
            
        if(polyfp_expr.get_op_type() == polyfp::o_add){
            auto add_1 = builder.create<mlir::arith::AddFOp>(builder.getUnknownLoc(), add_op[add_op.size()-2], add_op.back());
            all_add_op.push_back(add_1);
        }
        if(polyfp_expr.get_op_type() == polyfp::o_mul){
            auto mul_1 = builder.create<mlir::arith::MulFOp>(builder.getUnknownLoc(), mul_op[mul_op.size()-2], mul_op.back());
            all_mul_op.push_back(mul_1);
        }
        
    }
}

 
mlir::OwningOpRef<mlir::ModuleOp> mlirGen2(mlir::MLIRContext &context, polyfp::function &fct, isl_ast_node *node, int &level) {

    auto manager = MLIRGenImpl(context); 
    
    manager.mlirGen1(fct,node,level,true, false, false);
    // manager.getModule().dump();
    for(auto &comp : fct.leader_computations){
        int index = fct.leader_computation_index[comp];
        // std::cout<<"index:";
        // std::cout<<index<<std::endl;
        for(auto &kv : comp->get_directive_map()){
            if(kv.second == "pipeline"){
            
                int loc = comp->get_loop_level_number_from_dimension_name(kv.first);
                // std::cout<<"loc:";
                // std::cout<<loc<<std::endl;
                index = loc + index;
                
                mlir::scalehls::setLoopDirective(manager.ops[index], true, comp->II, false, false);
                // std::cout<<"level"<<std::endl;
            
                // std::cout<<"22222"<<std::endl;
                for(int i=1; i<=loc; i++){
                    mlir::scalehls::setLoopDirective(manager.ops[index-i], false, 1, false, true);
                }
                // std::cout<<"333"<<std::endl;

            }
        
        }  
                
    }
    // manager.mlirGen1(fct,node,level,true, false, false);


    // manager.get_funcs()[0].get
    // func
    // auto mem = funcs[0].getArgument(index_placeholder);
    // argument_map.insert(std::pair(p_name,mem));
    auto map = manager.get_argument_map();

    mlir::scalehls::setTopFuncAttr(manager.get_funcs()[0]);
    // manager.getModule().dump();
    
    // mlir::scalehls::applyAutoArrayPartition(manager.funcs[0]);
    for(auto &kv: fct.get_partition_map()){
        SmallVector<mlir::scalehls::hlscpp::PartitionKind, 4> kinds;
        SmallVector<unsigned, 4> factors;
        for(auto &factor: std::get<1>(kv)){
            factors.push_back(factor);
            // std::cout<<factor<<std::endl;
        }
        for(auto &type: std::get<2>(kv)){
            if(type == "cyclic"){
                kinds.push_back(mlir::scalehls::hlscpp::PartitionKind::CYCLIC);
            }else if(type == "block"){
                kinds.push_back(mlir::scalehls::hlscpp::PartitionKind::BLOCK);
            }else if(type == "none"){
                kinds.push_back(mlir::scalehls::hlscpp::PartitionKind::NONE);
            }
            // std::cout<<type<<std::endl;
        }
        
        // std::cout<<factors<<std::endl;
        mlir::scalehls::applyArrayPartition(map[std::get<0>(kv)], factors, kinds,/*updateFuncSignature=*/true);
        // mlir::scalehls::applyLegalizeToHLSCpp(manager.get_funcs()[0], true,true);
        // manager.getModule().dump();

    }


    // mlir::scalehls::applyLegalizeToHLSCpp(manager.get_funcs()[0], true,true);
                
     for(auto &comp: fct.leader_computations){
        if(comp->is_unrolled == true){
            for(int i=0; i<comp->unroll_dimension.size(); i++){
                int bias = comp->get_loop_level_number_from_dimension_name(comp->unroll_dimension[i].get_name());
                int loc = fct.leader_computation_index[comp];
                loc = loc + bias;
                if(comp->unroll_factor[i] != -1){
                    mlir::loopUnrollUpToFactor(manager.ops[loc],comp->unroll_factor[i]);
                }else{
                    mlir::loopUnrollFull(manager.ops[loc]);
                }
            }
            
            
        }

     }
    // mlir::loopUnrollFull(manager.ops[1]);
    // manager.getModule().dump();
    // mlir::scalehls::applyMemoryOpts(manager.get_funcs()[0]);
    // manager.getModule().dump();


    // Read target specification JSON file.
    std::string errorMessage;
    auto configFile = mlir::openInputFile("/home/jason/Hope/lib/Polyhedral/config.json", &errorMessage);
    if (!configFile) {
      llvm::errs() << errorMessage << "\n";
    //   return mlir::Pass::signalPassFailure();
    }

    // Parse JSON file into memory.
    auto config = llvm::json::parse(configFile->getBuffer());
    if (!config) {
      llvm::errs() << "failed to parse the target spec json file\n";
    //   return mlir::Pass::signalPassFailure();
    }
    auto configObj = config.get().getAsObject();
    if (!configObj) {
      llvm::errs() << "support an object in the target spec json file, found "
                      "something else\n";
    //   return mlir::Pass::signalPassFailure();
    }

    // Collect profiling latency and DSP usage data, where default values are
    // based on Xilinx PYNQ-Z1 board.
    llvm::StringMap<int64_t> latencyMap;
    mlir::scalehls::getLatencyMap(configObj, latencyMap);
    llvm::StringMap<int64_t> dspUsageMap;
    mlir::scalehls::getDspUsageMap(configObj, dspUsageMap);


    // auto latency = mlir::scalehls::getTiming(manager.get_funcs()[0]).getLatency();
    // auto dspNum = mlir::scalehls::getResource(manager.get_funcs()[0]).getDsp();

    // llvm::dbgs() << "The clock cycle is " << llvm::Twine(latency)
    //                        << ", DSP usage is " << llvm::Twine(dspNum) << ".\n\n";

    // Estimate performance and resource utilization. If any other functions are
    // called by the top function, it will be estimated in the procedure of
    // estimating the top function.


    //dataflow
    // mlir::scalehls::setFuncDirective(manager.get_funcs()[0],false,1,true);


    // mlir::scalehls::ScaleHLSEstimator(latencyMap, dspUsageMap, true).estimateLoop(manager.ops[0],manager.funcs[0]);
    //     auto latency = mlir::scalehls::getTiming(manager.ops[0]).getLatency();
    // auto dspNum = mlir::scalehls::getResource(manager.ops[0]).getDsp();
    //     llvm::dbgs() << "The clock cycle is " << llvm::Twine(latency)
    //                        << ", DSP usage is " << llvm::Twine(dspNum) << ".\n\n";

    // mlir::scalehls::ScaleHLSEstimator estimator;   
    // estimator.estimateFunc(manager.funcs[0]);
    // const auto &comp = fct.get_body()[0];

        
//   return manager.mlirGen1(fct,node,level,true, false, false);
    return manager.getModule();
}
mlir::ModuleOp polyfp::MLIRGenImpl::getModule(){
    return this->theModule;
} 
void gen_mlir(polyfp::function &fct, isl_ast_node *node, int &level){
    mlir::MLIRContext context;

    context.disableMultithreading();
    //   context.getOrLoadDialect<AffineDialect>();
    //   context.getOrLoadDialect<StandardOpsDialect>();
    context.getOrLoadDialect<mlir::scf::SCFDialect>();
    context.getOrLoadDialect<mlir::func::FuncDialect>();
    context.getOrLoadDialect<mlir::AffineDialect>();
    context.getOrLoadDialect<mlir::LLVM::LLVMDialect>();
    // context.getOrLoadDialect<mlir::StandardOpsDialect>();
    context.getOrLoadDialect<mlir::math::MathDialect>();
    context.getOrLoadDialect<mlir::memref::MemRefDialect>();
    context.getOrLoadDialect<mlir::scalehls::HLSCppDialect>();
    mlir::OwningOpRef<mlir::ModuleOp> module = mlirGen2(context, fct, node, level);
    mlir::verify(*module);
    if (failed(mlir::verify(*module))) {
        module->emitError("module verification error");
        // module->dump();
    }
    
    // module->dump();
    std::error_code error;
    std::string s = fct.get_name();
    std::string path = "/home/jason/Hope/samples/"+s+".mlir";
    llvm::raw_fd_ostream os(path, error);
    os << *module;
        

}
void function::gen_mlir_stmt()
{   
    int level = 0;
    // mlir::ModuleOp module;
    gen_mlir(*this,this->get_isl_ast(),level);
}
//////////////////////////////////////////////////////////////////////





}


  


  