function enviar() {
    
    var mensaje = document.getElementById("texto").value;
    
    $.ajax({
        url:"Mensajes.jsp",
        data:  { mensaje : $("#texto").val() },
        success: function(result){
            
            $("#chat").html(result);
            var wtf    = $('#chat');
            var height = wtf[0].scrollHeight;
            wtf.scrollTop(height+100);
        
        }
        
    });
    
}    

setInterval( function mirar(){
    
    $.ajax({
        url:"Mensajes.jsp",
        success: function(result){
            
            if( ($("#chat")[0].scrollHeight - $("#chat").scrollTop()) == $("#chat").height() ){    
                
                console.log( "resta "+ ($("#chat")[0].scrollHeight - $("#chat").scrollTop() ) );
                console.log( "height "+ $("#chat").height() );
                
                $("#chat").append(result);
                var wtf    = $('#chat');
                var height = wtf[0].scrollHeight;
                wtf.scrollTop(height+100);
            
            }else{
                
                $("#chat").append(result);
            
            }
        }
        
    });
    
} , 250);

/*-------- Boton de enviar ---------*/

$(document).ready( function(){
    
    $("#enviar").on("click", function(){
        $("#texto").val("");
        $("#enviar").prop('disabled',true);
    });
    
    $("#texto").keyup(function(){
        
        if ($("#texto").val() === "" ){
            $("#enviar").prop('disabled',true);
        }else{
            $("#enviar").prop('disabled',false);
        }
    });
    
});

