import 'package:application_news/modules/search/search.dart';
import 'package:application_news/shared/cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
Widget DefaultFormField({
  required TextEditingController controller,
  required TextInputType textType ,
  required Icon icon,
  var submitted,
  var onchanged,
  var ontap,
  required validator,
  required String labelText,
  bool  obscure = false ,
  dynamic sufpressed,
  Icon? iconsuf,})=> TextFormField(
  controller: controller,
  keyboardType: textType, // yhadd naw3 l clavier li yokhrj
  obscureText: obscure,
  decoration: InputDecoration(
    labelText: labelText, // kyn hint text
    prefixIcon: icon,  //icon li mn l godam
    border: OutlineInputBorder(),
    suffixIcon: iconsuf != null ? IconButton(onPressed: sufpressed, icon: iconsuf) : null,
  ),
  onFieldSubmitted:submitted, // ba3d ma dakhli l value w tkliki done
  onTap: ontap,
  onChanged: onchanged,// hadi w ana nktb  byn results mich hata ndir done
  validator: validator,

);

Widget BuildArticleItem(article, context)=>Padding(
  padding:EdgeInsets.all(20.0) ,
  child: Row(
    children: [
      Container(
        height: 120.0,
        width: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image:  DecorationImage(
            image: NetworkImage('${article['urlToImage']}'),
            fit: BoxFit.cover,
          ),

        ),
      ),
      const SizedBox(
        width: 20.0,),
      Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              mainAxisAlignment:MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Expanded(
                  child: Text('${article['title']}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600

                    ),
                  ),
                ),
                Text('${article['publishedAt']}',
                  style:Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          )),
    ],
  ),);

Widget ArticleBuilder(list, context)=>
    ConditionalBuilder(
    condition:list.length>0,
    builder: (context)=>ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index)=>BuildArticleItem(list[index],context),
        separatorBuilder: (context, index)=>Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey,
        ),
        itemCount: 10),
    fallback: (context)=>Center(child: CircularProgressIndicator(),));

void Navigateto(context, widget)=> Navigator.push(context,

    MaterialPageRoute(builder: (context)=>widget));

