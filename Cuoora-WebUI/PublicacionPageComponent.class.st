Class {
	#name : #PublicacionPageComponent,
	#superclass : #CuooraPageComponent,
	#instVars : [
		'publicacion'
	],
	#category : #'Cuoora-WebUI'
}

{ #category : #accessing }
PublicacionPageComponent class >> publicacion: unaPublicacion [
	^ self new
		publicacion: unaPublicacion;
		yourself
]

{ #category : #accessing }
PublicacionPageComponent >> publicacion [
	^ publicacion
]

{ #category : #accessing }
PublicacionPageComponent >> publicacion: anObject [
	publicacion := anObject
]

{ #category : #rendering }
PublicacionPageComponent >> renderLikesDislikeOptionsOn: html [
	html
		paragraph: [ html space.
			html space.
			html space.
			html anchor
				id: 'likes';
				callback: [ self publicacion likeUsuario: self session user ];
				with: 'Like '.
			html text: ' | '.
			html anchor
				id: 'likes';
				callback: [ self publicacion dislikeUsuario: self session user ];
				with: ' Dislike' ]
]

{ #category : #rendering }
PublicacionPageComponent >> renderLikesDislikesOn: html publicacion: unaPublicacion [

	self publicacion: unaPublicacion.
	self renderTotalLikesDislikesOn: html.
	self renderLikesDislikeOptionsOn: html
]

{ #category : #rendering }
PublicacionPageComponent >> renderTotalLikesDislikesOn: html [
	html
		paragraph: [ html
				strong: self totalLikes;
				text: ' Likes';
				text: ' | ';
				strong: self totalDislikes;
				text: ' Dislikes' ]
]

{ #category : #actions }
PublicacionPageComponent >> totalDislikes [
	^ publicacion totalDislikes
]

{ #category : #actions }
PublicacionPageComponent >> totalLikes [
	^ publicacion totalLikes
]
