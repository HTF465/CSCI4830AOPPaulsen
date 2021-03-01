
public aspect TraceAspectPaulsen {
	pointcut classToTrace(): within(*App);
	pointcut methodToTrace(): classToTrace() && execution(String getName());
	
	before(): methodToTrace(){
		String info = String.format("[BGN] %s, %s", thisJoinPointStaticPart.getSignature(), thisJoinPointStaticPart.getSourceLocation().getLine());
		System.out.println(info);
	}
	after(): methodToTrace(){
		String info = String.format("[END] %s", thisJoinPointStaticPart.getSourceLocation().getFileName());
		System.out.println(info);
	}

}
