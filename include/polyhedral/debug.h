#ifndef _H_DEBUG_
#define _H_DEBUG_

#include <iostream>

/**
  * Set to true to enable printing the generated Halide IR after
  * the code generation step. Set to false to disable this.
  * Halide IR will be printed even if ENABLE_DEBUG is set to false.
  */
#define PRINT_HALIDE_IR_AFTER_CODEGEN 1

/**
  * Set to true to enable printing the final (fully simplified)
  * generated Halide IR.
  */
#define PRINT_FINAL_HALIDE_IR_AFTER_CODEGEN 0


/**
  * Set to true to enable debugging and false to disable debugging.
  * Debugging here means printing the results of each polyfp pass.
  */
#ifndef ENABLE_DEBUG
#define ENABLE_DEBUG true
#endif // ENABLE_DEBUG

/**
  * Debugging level.
  * Set to 3 if you want to enable basic debugging.
  * Set to 10 if you want to enable full debugging information
  * (this will print detailed debugging information).
  */
#ifndef DEBUG_LEVEL
#define DEBUG_LEVEL 0
#endif // DEBUG_LEVEL

namespace polyfp
{

void str_dump(const std::string &str);
void str_dump(const std::string &str, const char *str2);
void str_dump(const char *str, const char *str2);
void print_indentation();

extern int polyfp_indentation;

} // namespace polyfp

/**
  * Print function name.
  */
#define DEBUG_FCT_NAME(LEVEL) {                 \
    if (ENABLE_DEBUG && DEBUG_LEVEL>=LEVEL) {   \
        polyfp::print_indentation();          \
        polyfp::str_dump("[");                \
        polyfp::str_dump(__FUNCTION__);       \
        polyfp::str_dump(" function]\n");     \
    }                                           \
    std::flush(std::cout);                      \
};

/**
  * Run \p STMT if the debugging level is above \p LEVEL.
  */
#define DEBUG(LEVEL, STMT) {                    \
    if (ENABLE_DEBUG && DEBUG_LEVEL>=LEVEL) {   \
        polyfp::print_indentation();          \
        STMT;                                   \
        polyfp::str_dump("\n");               \
    }                                           \
    std::flush(std::cout);                      \
};

/**
  * Run \p STMT if the debugging level is above \p LEVEL.
  * If \p NEW_LINE is set to true, then a new line is printed at
  * the end of DEBUG.
  */
#define DEBUG_NO_NEWLINE(LEVEL, STMT) {         \
    if (ENABLE_DEBUG && DEBUG_LEVEL>=LEVEL) {   \
        polyfp::print_indentation();          \
        STMT;                                   \
    }                                           \
    std::flush(std::cout);                      \
};

#define DEBUG_NO_NEWLINE_NO_INDENT(LEVEL, STMT) {         \
    if (ENABLE_DEBUG && DEBUG_LEVEL>=LEVEL) {   \
        STMT;                                   \
    }                                           \
    std::flush(std::cout);                      \
};



#define DEBUG_NEWLINE(LEVEL) {                  \
    if (ENABLE_DEBUG && DEBUG_LEVEL>=LEVEL) {   \
        polyfp::str_dump("\n");               \
    }                                           \
    std::flush(std::cout);                      \
};

/**
  * Change the indentation printed before running IF_DEBUG.
  * Useful to indent the text printed by IF_DEBUG.
  */
#define DEBUG_INDENT(x) {polyfp::polyfp_indentation = polyfp::polyfp_indentation + x;}

#define ERROR(message, exit_program) {                      \
    std::cerr << "Error in " << __FILE__ << ":"             \
              << __LINE__ << " - " << message << std::endl; \
    if (exit_program)                                       \
    {                                                       \
        exit(1);                                            \
    }                                                       \
}

#endif
