iseq = RubyVM::InstructionSequence.compile_file(ARGV[0], {tailcall_optimization:true, trace_instruction:false})
iseq.eval
