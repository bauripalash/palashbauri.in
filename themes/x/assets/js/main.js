const mdid = "masto_share"; //mastodon button id
const ldb = localStorage; //local storage shortcut
const dtc = "dark_theme" //dark theme class name
const tsid = "theme_switch"; //theme switch button id
const lbn =  "[🔆]" //light theme button text
const dbn = "[🌜]" //dark theme button text
const inv = "Invalid mastodon instance url"

document.addEventListener('DOMContentLoaded', function(_e) {
   if (ldb.getItem("dark") == "true"){
        document.body.classList.add(dtc);
        document.getElementById(tsid).innerHTML = lbn;
    }
})

const masto_button = document.getElementById(mdid);

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
                alert(inv);
            }
        }else{
            const mi_temp = "https://" + masto_instance;
            if (is_valid_url(mi_temp)){
                share_toot(mi_temp);
            }
            else{
                alert(inv);
            }
        }

    }
    

}
}

function share_toot(instance){
    window.open( instance + "/share?text={{ .Title }} \n {{.Permalink}}" , "_blank");
}



const theme_switch_button = document.getElementById(tsid);

theme_switch_button.onclick = function(){
    
    if (ldb.getItem("dark") == "true"){
        document.body.classList.remove(dtc);
document.getElementById(tsid).innerHTML = dbn;

        ldb.removeItem("dark");
    }else{
        document.body.classList.add(dtc);

        ldb.setItem("dark", true);
document.getElementById(tsid).innerHTML = lbn;
    }


}
