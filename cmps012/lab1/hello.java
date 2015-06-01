//$Id: hello.java,v 1.2 2015-01-14 21:54:05-08 - - $
//Adam Pinarbasi
//akpinarb

class hello
{
    public static void main(String[]args)
    {
        if(args.length == 0)
            System.out.printf("Hello, World!\n");
        else
        {
            System.err.printf("Usage: hello\n");
            System.exit(1);
        }
    }
}

