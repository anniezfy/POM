#include "placeholder.h"
#include <iostream>
namespace polyfp{

// polyfp::placeholder::placeholder() : is_dummy(true){}

polyfp::placeholder::placeholder(std::string name, std::vector<int64_t> dim_sizes,
                         polyfp::primitive_t type, polyfp::function *fct):
                         dim_sizes(dim_sizes), fct(fct),
                         name(name), type(type)
{

    fct->add_placeholder(std::pair<std::string, polyfp::placeholder *>(name, this));
};

void placeholder::partition(std::vector<int> factors, std::string type){
    //TODO"CHECK DIMENSIONS AND WARNING
    std::vector<std::string> types;
    for (int dim = 0; dim < factors.size(); ++dim) {
        types.push_back(type);
    }
    this->fct->set_partition(this->get_name(),factors,types);

}
// TODO
void placeholder::partition(std::vector<int> factors, std::vector<std::string> types){
    //TODO"CHECK DIMENSIONS AND WARNING
    this->fct->set_partition(this->get_name(),factors,types);
    

}



/**
  * Return the name of the buffer.
  */
const std::string &placeholder::get_name() const
{
    return name;
}

/**
  * Get the number of dimensions of the buffer.
  */
int placeholder::get_n_dims() const
{
    return this->get_dim_sizes().size();
}

/**
  * Return the type of the elements of the buffer.
  */
polyfp::primitive_t placeholder::get_elements_type() const
{
    return type;
}

/**
  * Return the sizes of the dimensions of the buffer.
  * Assuming the following buffer: buf[N0][N1][N2].  The first
  * vector element represents the size of rightmost dimension
  * of the buffer (i.e. N2), the second vector element is N1,
  * and the last vector element is N0.
  */
const std::vector<int64_t> &placeholder::get_dim_sizes() const
{
    return dim_sizes;
}

void polyfp::placeholder::dump(bool exhaustive) const
{
    if (ENABLE_DEBUG)
    {
        std::cout << "Buffer \"" << this->name
                  << "\", Number of dimensions: " << this->get_n_dims()
                  << std::endl;

        std::cout << "Dimension sizes: ";
        for (const auto &size : dim_sizes)
        {
            // size.dump(false);
            std::cout << "    ";
        }
        std::cout << std::endl;

        std::cout << "Elements type: "
                  << str_from_polyfp_type_primitive(this->type) << std::endl;

        // std::cout << "Function field: "
        //           << str_from_is_null(this->fct) << std::endl;

        // std::cout << "Argument type: "
        //           << str_from_polyfp_type_argument(this->argtype) << std::endl;

        std::cout << std::endl << std::endl;
    }
}


}

