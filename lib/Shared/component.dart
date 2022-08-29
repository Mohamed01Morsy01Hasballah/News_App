
import 'package:flutter/material.dart';
import 'package:news_app/Modules/WebViewScreen.dart';

Widget BuildRowItem(articles,context)=>InkWell(
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          height: 120,

          width:120,

          decoration:BoxDecoration(



              image:DecorationImage(

                image: NetworkImage('${articles['urlToImage']}'),

                fit: BoxFit.fill,



              )

          ),

        ),

        SizedBox(

          width:20,

        ),

        Expanded(

          child: Container(

            height: 120,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [



                Expanded(

                  child: Text(

                    '${articles['title']}',

                    maxLines: 4,

                    overflow:TextOverflow.ellipsis,

                    style: Theme.of(context).textTheme.bodyText1,

                  ),

                ),



                Text(

                    '${articles['publishedAt']}',

                  style: Theme.of(context).textTheme.bodyText2

                )

              ],

            ),

          ),

        )

      ],

    ),

  ),
  onTap: (){
    navigateTo(context, WebViewScreen(articles['url']));
  }
);
Widget DefaultTextField(
    {
      required TextInputType? type,
      required TextEditingController? controller,
      required String label,
      required IconData prefix,
      IconData? suffix,
      required  function,
      bool secure = false,
      SuffixPressed,
      Function? onSubmit,
      OnTap,
      Function? onchange,
    }
    )=>TextFormField(
  onTap: OnTap,
  keyboardType: type,
  obscureText: secure,
  controller:controller ,
  validator:function,
  onFieldSubmitted:(s) {
    onSubmit!(s);
  },
  onChanged: (n){
    onchange!(n);
  },

  decoration:InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      prefixIcon: Icon(
          prefix
      ),
      suffixIcon: TextButton(
        onPressed: SuffixPressed,
        child: Icon(
            suffix
        ),
      )

  ) ,
);
void navigateTo(
    context,
    Widget
    )=>Navigator.push(context,
    MaterialPageRoute(builder: (context)=>Widget));