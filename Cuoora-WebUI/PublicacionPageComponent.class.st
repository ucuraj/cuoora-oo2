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
PublicacionPageComponent >> renderContentPageOn: html [
	self subclassResponsibility. 
]

{ #category : #rendering }
PublicacionPageComponent >> renderLikesDislikeOptionsOn: html [
	html
		span: [ html anchor
				class: 'pr-1';
				callback: [ self publicacion likeUsuario: self session user ];
				with: [ html badge
						beSuccess;
						with: 'Like' ].
			html anchor
				class: 'pl-1';
				callback: [ self publicacion dislikeUsuario: self session user ];
				with: [ html badge beDanger
						beDanger;
						with: 'Dislike' ] ].
	html break.
]

{ #category : #rendering }
PublicacionPageComponent >> renderLikesDislikesOn: html publicacion: unaPublicacion [

	self publicacion: unaPublicacion.
	self renderLikesDislikeOptionsOn: html.
	self renderTotalLikesDislikesOn: html.
	
]

{ #category : #rendering }
PublicacionPageComponent >> renderTotalLikesDislikesOn: html [
	html
		span: [ html
				strong class:'texto-interaccion'; with: [html text: self totalLikes;
				text: ' Likes | ';
				strong: self totalDislikes;
				text: ' Dislikes' ]].
	html break.
]

{ #category : #actions }
PublicacionPageComponent >> totalDislikes [
	^ publicacion totalDislikes
]

{ #category : #actions }
PublicacionPageComponent >> totalLikes [
	^ publicacion totalLikes
]
