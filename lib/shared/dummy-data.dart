import 'package:ex_books/models/book.dart';
import 'package:ex_books/models/category.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


 final DUMMY_CATEGORIES =  [

  Categoreey(
    id: 'c1',
    title: 'Magical',
  ),
  Categoreey(
    id: 'c2',
    title: 'Classic',
  ),
  Categoreey(
    id: 'c3',
    title: 'Drama',
  ),
  Categoreey(
    id: 'c4',
    title: 'Historical',
  ),
  Categoreey(
    id: 'c5',
    title: 'Horror',
  ),
  Categoreey(
    id: 'c6',
    title: 'Mystery',
  ),
  Categoreey(
    id: 'c7',
    title: 'Romance',
  ),
  Categoreey(
    id: 'c8',
    title: 'Short Story',
  ),
  Categoreey(
    id: 'c9',
    title: 'Sceience Fiction',
  ),
  Categoreey(
    id: 'c10',
    title: 'Action And Adventure',
  ),
  Categoreey(
    id: 'c11',
    title: 'Crime and Detective',
  ),
  Categoreey(
    id: 'c12',
    title: 'Comic and Graphic',
  ),
];

// const DUMMY_BOOKS = const [
//   Book(
//       id: 'b1',
//       categories: [
//         'c1',
//         'c7',
//       ],
//       title: 'Harry Potter',
//       authorName: 'J.K. Rowling',
//       price: 20,
//       userName: 'Rehab Abdallah',
//       userImageUrl: 'https://img.clipartlook.com/person-people-icon-clipart-kid-person-clipart-1862_2400.png',
//       imageUrl: 'https://hpmedia.bloomsbury.com/rep/s/9781408855959_309031.jpeg',
//       describtion: 'Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry’s eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin! ' ,
//   ),
//   Book(
//     id: 'b2',
//     categories: [
//       'c2',
//       'c5',
//     ],
//     title: 'Torab Al mas',
//     authorName: 'Ahmed mourad',
//     price: 20,
//     userName: 'Rehab Abdallah',
//     userImageUrl: 'https://img.clipartlook.com/person-people-icon-clipart-kid-person-clipart-1862_2400.png',
//     imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
//     describtion: 'bi7ki 3n sidli babah 2tl wa7d shrir w 7atlo powder abiad w hia torab ll mas fi ll shay f zhrt 3lih a3rad mrd m7dsh 3arf y3algo wl yktshf sbbo ' ,
//   ),
//   Book(
//     id: 'b3',
//     categories: [
//       'c3',
//       'c6',
//     ],
//     title: 'Torab Al mas',
//     authorName: 'Ahmed mourad',
//     price: 20,
//     userName: 'Rehab Abdallah',
//     userImageUrl: 'https://img.clipartlook.com/person-people-icon-clipart-kid-person-clipart-1862_2400.png',
//     imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
//     describtion: 'bi7ki 3n sidli babah 2tl wa7d shrir w 7atlo powder abiad w hia torab ll mas fi ll shay f zhrt 3lih a3rad mrd m7dsh 3arf y3algo wl yktshf sbbo ' ,
//   ),
//   Book(
//     id: 'b4',
//     categories: [
//       'c4',
//       'c10',
//     ],
//     title: 'Torab Al mas',
//     authorName: 'Ahmed mourad',
//     price: 20,
//     userName: 'Rehab Abdallah',
//     userImageUrl: 'https://img.clipartlook.com/person-people-icon-clipart-kid-person-clipart-1862_2400.png',
//     imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
//     describtion: 'bi7ki 3n sidli babah 2tl wa7d shrir w 7atlo powder abiad w hia torab ll mas fi ll shay f zhrt 3lih a3rad mrd m7dsh 3arf y3algo wl yktshf sbbo ' ,
//   ),
//   Book(
//     id: 'b5',
//     categories: [
//       'c5',
//       'c9',
//     ],
//     title: 'Torab Al mas',
//     price: 20,
//     userName: 'Rehab Abdallah',
//     userImageUrl: 'https://img.clipartlook.com/person-people-icon-clipart-kid-person-clipart-1862_2400.png',
//     authorName: 'Ahmed mourad',
//     imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
//     describtion: 'bi7ki 3n sidli babah 2tl wa7d shrir w 7atlo powder abiad w hia torab ll mas fi ll shay f zhrt 3lih a3rad mrd m7dsh 3arf y3algo wl yktshf sbbo ' ,
//   ),
//   Book(
//     id: 'b6',
//     categories: [
//       'c6',
//       'c12',
//     ],
//     title: 'Torab Al mas',
//     authorName: 'Ahmed mourad',
//     price: 20,
//     userName: 'Rehab Abdallah',
//     userImageUrl: 'https://img.clipartlook.com/person-people-icon-clipart-kid-person-clipart-1862_2400.png',
//     imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
//     describtion: 'bi7ki 3n sidli babah 2tl wa7d shrir w 7atlo powder abiad w hia torab ll mas fi ll shay f zhrt 3lih a3rad mrd m7dsh 3arf y3algo wl yktshf sbbo ' ,
//   ),
//   Book(
//     id: 'b7',
//     categories: [
//       'c7',
//       'c11',
//     ],
//     title: 'Torab Al mas',
//     authorName: 'Ahmed mourad',
//     price: 20,
//     userName: 'Rehab Abdallah',
//     userImageUrl: 'https://img.clipartlook.com/person-people-icon-clipart-kid-person-clipart-1862_2400.png',
//     imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
//     describtion: 'bi7ki 3n sidli babah 2tl wa7d shrir w 7atlo powder abiad w hia torab ll mas fi ll shay f zhrt 3lih a3rad mrd m7dsh 3arf y3algo wl yktshf sbbo ' ,
//   ),
//   Book(
//     id: 'b8',
//     categories: [
//       'c8',
//       'c9',
//     ],
//     title: 'Torab Al mas',
//     price: 20,
//     userName: 'Rehab Abdallah',
//     userImageUrl: 'https://img.clipartlook.com/person-people-icon-clipart-kid-person-clipart-1862_2400.png',
//     authorName: 'Ahmed mourad',
//     imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
//     describtion: 'bi7ki 3n sidli babah 2tl wa7d shrir w 7atlo powder abiad w hia torab ll mas fi ll shay f zhrt 3lih a3rad mrd m7dsh 3arf y3algo wl yktshf sbbo ' ,
//   ),
//   Book(
//     id: 'b9',
//     categories: [
//       'c9',
//       'c4',
//     ],
//     title: 'Torab Al mas',
//     authorName: 'Ahmed mourad',
//     price: 20,
//     userName: 'Rehab Abdallah',
//     userImageUrl: 'https://img.clipartlook.com/person-people-icon-clipart-kid-person-clipart-1862_2400.png',
//     imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
//     describtion: 'bi7ki 3n sidli babah 2tl wa7d shrir w 7atlo powder abiad w hia torab ll mas fi ll shay f zhrt 3lih a3rad mrd m7dsh 3arf y3algo wl yktshf sbbo ' ,
//   ),
//   Book(
//     id: 'b10',
//     categories: [
//       'c10',
//       'c2',
//     ],
//     title: 'Harry Potter',
//     authorName: 'J.K. Rowling',
//     price: 20,
//     userName: 'Rehab Abdallah',
//     userImageUrl: 'https://img.clipartlook.com/person-people-icon-clipart-kid-person-clipart-1862_2400.png',
//     imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/51HSkTKlauL._SX346_BO1,204,203,200_.jpg',
//     describtion: 'Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry’s eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin! ' ,
//   ),
//   Book(
//     id: 'b11',
//     categories: [
//       'c11',
//       'c1',
//     ],
//     title: 'Harry Potter',
//     authorName: 'Ahmed mourad',
//     price: 20,
//     userName: 'Fatma Kamal',
//     userImageUrl: 'https://img.clipartlook.com/person-people-icon-clipart-kid-person-clipart-1862_2400.png',
//     imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/51HSkTKlauL._SX346_BO1,204,203,200_.jpg',
//     describtion: 'bi7ki 3n sidli babah 2tl wa7d shrir w 7atlo powder abiad w hia torab ll mas fi ll shay f zhrt 3lih a3rad mrd m7dsh 3arf y3algo wl yktshf sbbo ' ,
//   ),
//   Book(
//     id: 'b12',
//     categories: [
//       'c10',
//       'c2',
//     ],
//     title: 'Torab Al mas',
//     price: 20,
//     userName: 'Rehab Abdallah',
//     userImageUrl: 'https://img.clipartlook.com/person-people-icon-clipart-kid-person-clipart-1862_2400.png',
//     authorName: 'Ahmed mourad',
//     imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
//     describtion: 'bi7ki 3n sidli babah 2tl wa7d shrir w 7atlo powder abiad w hia torab ll mas fi ll shay f zhrt 3lih a3rad mrd m7dsh 3arf y3algo wl yktshf sbbo ' ,
//   ),
//   Book(
//     id: 'b13',
//     categories: [
//       'c11',
//       'c3',
//     ],
//     title: 'Torab Al mas',
//     price: 20,
//     userName: 'Rehab Abdallah',
//     userImageUrl: 'https://img.clipartlook.com/person-people-icon-clipart-kid-person-clipart-1862_2400.png',
//     authorName: 'Ahmed mourad',
//     imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
//     describtion: 'bi7ki 3n sidli babah 2tl wa7d shrir w 7atlo powder abiad w hia torab ll mas fi ll shay f zhrt 3lih a3rad mrd m7dsh 3arf y3algo wl yktshf sbbo ' ,
//   ),
//   Book(
//     id: 'b14',
//     categories: [
//       'c7',
//       'c3',
//     ],
//     title: 'Torab Al mas',
//     price: 20,
//     userName: 'Rehab Abdallah',
//     userImageUrl: 'https://img.clipartlook.com/person-people-icon-clipart-kid-person-clipart-1862_2400.png',
//     authorName: 'Ahmed mourad',
//     imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
//     describtion: 'bi7ki 3n sidli babah 2tl wa7d shrir w 7atlo powder abiad w hia torab ll mas fi ll shay f zhrt 3lih a3rad mrd m7dsh 3arf y3algo wl yktshf sbbo ' ,
//   ),
//   Book(
//     id: 'b15',
//     categories: [
//       'c5',
//       'c4',
//     ],
//     title: 'Torab Al mas',
//     authorName: 'Ahmed mourad',
//     price: 20,
//     userName: 'Rehab Abdallah',
//     userImageUrl: 'https://img.clipartlook.com/person-people-icon-clipart-kid-person-clipart-1862_2400.png',
//     imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
//     describtion: 'bi7ki 3n sidli babah 2tl wa7d shrir w 7atlo powder abiad w hia torab ll mas fi ll shay f zhrt 3lih a3rad mrd m7dsh 3arf y3algo wl yktshf sbbo ' ,
//   ),

// ];
