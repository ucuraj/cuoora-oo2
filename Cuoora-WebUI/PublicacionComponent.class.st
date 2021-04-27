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

{ #category : #actions }
PublicacionComponent >> buscarDislike [
	^ self publicacion buscarDislike: self session user user.
	
]

{ #category : #actions }
PublicacionComponent >> buscarLike [
	^ self publicacion buscarLike: self session user user.
]

{ #category : #actions }
PublicacionComponent >> dislikeUsuario [
	self publicacion iteraccionConUsuario: (self session user) unTipo:'Dislike'.
]

{ #category : #actions }
PublicacionComponent >> likeUsuario [
	self publicacion iteraccionConUsuario: (self session user) unTipo:'Like'.
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
				callback: [ self likeUsuario ];
				with: [ html outlineButton
						class:
							(self buscarLike isNotNil
								ifTrue: [ 'active' ]);
						beSmall;
						beSuccess;
						with: 'Like' ] ].
	html anchor
		class: 'pl-1';
		callback: [ self dislikeUsuario ];
		with: [ html outlineButton
				class:
					(self buscarDislike isNotNil
						ifTrue: [ 'active' ]);
				beSmall;
				beDanger;
				with: 'Dislike' ].
	html break
]

{ #category : #rendering }
PublicacionComponent >> renderLikesDislikesOn: html publicacion: unaPublicacion [
	self publicacion: unaPublicacion.
	self renderLikesDislikeOptionsOn: html.
	self renderTotalLikesDislikesOn: html
]

{ #category : #rendering }
PublicacionComponent >> renderTotalLikesDislikesOn: html [
	html
		span: [ html strong
				class: 'texto-interaccion';
				with: [ html
						text: self totalLikes;
						text: ' Likes | ';
						strong: self totalDislikes;
						text: ' Dislikes' ] ].
	html break
]

{ #category : #actions }
PublicacionComponent >> totalDislikes [
	^ publicacion totalDislikes
]

{ #category : #actions }
PublicacionComponent >> totalLikes [
	^ publicacion totalLikes
]
