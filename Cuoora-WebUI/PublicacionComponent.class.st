Class {
	#name : #PublicacionComponent,
	#superclass : #CuooraPageComponent,
	#instVars : [
		'publicacion'
	],
	#category : #'Cuoora-WebUI'
}

{ #category : #accessing }
PublicacionComponent class >> publicacion: unaPublicacion [
	^ self new
		publicacion: unaPublicacion;
		yourself
]

{ #category : #accessing }
PublicacionComponent >> publicacion [
	^ publicacion
]

{ #category : #accessing }
PublicacionComponent >> publicacion: anObject [
	publicacion := anObject
]

{ #category : #rendering }
PublicacionComponent >> renderContentPageOn: html [
	self subclassResponsibility. 
]

{ #category : #rendering }
PublicacionComponent >> renderLikesDislikeOptionsOn: html [
	html
		span: [ html anchor
				class: 'pr-1';
				callback: [ self publicacion likeUsuario: self session user ];
				with: [ ((self publicacion buscarLike:self session user user) isNotNil)
					ifTrue:[html outlineButton
						beActive;
						beSmall;
						beSuccess;
						with: 'Like'];
					ifFalse:[html outlineButton
						beSuccess;
						beSmall;
						with: 'Like']
					 ].
				].
			html anchor
				class: 'pl-1';
				callback: [ self publicacion dislikeUsuario: self session user ];
				with: [ ((self publicacion buscarDislike:self session user user) isNotNil)
					ifTrue:[html outlineButton
						beActive;
						beSmall;
						beDanger;
						with: 'Dislike'] 
					ifFalse:[html outlineButton
						beDanger;
						beSmall;
						with: 'Dislike'].
					 ].
	html break. 
]

{ #category : #rendering }
PublicacionComponent >> renderLikesDislikesOn: html publicacion: unaPublicacion [

	self publicacion: unaPublicacion.
	self renderLikesDislikeOptionsOn: html.
	self renderTotalLikesDislikesOn: html.
	
]

{ #category : #rendering }
PublicacionComponent >> renderTotalLikesDislikesOn: html [
	html
		span: [ html
				strong class:'texto-interaccion'; with: [html text: self totalLikes;
				text: ' Likes | ';
				strong: self totalDislikes;
				text: ' Dislikes' ]].
	html break.
]

{ #category : #actions }
PublicacionComponent >> totalDislikes [
	^ publicacion totalDislikes
]

{ #category : #actions }
PublicacionComponent >> totalLikes [
	^ publicacion totalLikes
]
