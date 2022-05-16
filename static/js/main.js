const mastodon_button_id = "masto_share";

const masto_button = document.getElementById(mastodon_button_id);

function is_valid_url(string) {
  let url;
  
  try {
    url = new URL(string);
  } catch (_) {
    return false;  
  }

  return url.protocol === "http:" || url.protocol === "https:";
}

if (masto_button){
masto_button.onclick = function(){ 
    
    let masto_instance = prompt("Mastodon instance url?" , "https://");

    if (masto_instance){
        masto_instance = masto_instance.trim();
        if (masto_instance.startsWith("https://") || masto_instance.startsWith("http://")){
            if (is_valid_url(masto_instance)){
                share_toot(masto_instance);
            }
            else{
                alert("Invalid instance url");
            }
        }else{
            const mi_temp = "https://" + masto_instance;
            if (is_valid_url(mi_temp)){
                share_toot(mi_temp);
            }
            else{
                alert("Invalid instance url");
            }
        }

    }
    

}
}

function share_toot(instance){
    console.log(instance);
}


const theme_switch_id = "theme_switch";

const theme_switch_button = document.getElementById(theme_switch_id);

theme_switch_button.onclick = function(){
    
   document.body.classList.toggle("dark_theme");
//document.documentElement.setAttribute("data-theme", "dark");
    console.log('working');

}
