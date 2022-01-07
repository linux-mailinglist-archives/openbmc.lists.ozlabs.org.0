Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B38487BDE
	for <lists+openbmc@lfdr.de>; Fri,  7 Jan 2022 19:12:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVrsF1Mtcz3bTT
	for <lists+openbmc@lfdr.de>; Sat,  8 Jan 2022 05:12:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=V74VcISQ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=MII+Gw2k;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=V74VcISQ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=MII+Gw2k; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVrrm4dsZz2yPT
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jan 2022 05:11:35 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 07B825C012B
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jan 2022 13:11:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 07 Jan 2022 13:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm3; bh=ODbz046oB08foAgVgGKZmrrcQsoGp9a42XZKX9eRhs4=; b=V74VcISQ
 RvM5TRNcek0R1b2PNcAvCQxsDVBnZ5erc0MFeMBJJlC6Pih60+UfN/tN6l4zA8Pk
 fpZVbHpVyqB/4mCPu5CLQ9IrQiBQKuyVWVSwbO6PHh9tlT3HaFbDYwP+8CLdhyt8
 M0PRE1cXpFKLsVQ88nyoqrf+IhiEgr8ZhJRnEUWneB3HJx02s/3N31VSKbD1gr4b
 uvjjjZXe6prspnQI23fqZIgMgFXgCiwsKWAy6+jZbpqH0Q9IwdIwcKL9cg+rtwhk
 Yac5kYccUHJcxtQLhUOL5krLaIhEohLLIuMSZ08FXp7g8JvSG7oqfGVJwTFKoVxE
 z+MbLgkNJjw/rQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=ODbz046oB08foAgVgGKZmrrcQsoGp
 9a42XZKX9eRhs4=; b=MII+Gw2kqh7DC9vu0Kvb3AQy5e2KtNLfm9Kqtr84ZMybP
 ULm3/3j8o9jZBBpr7yetJAOIpbBZ7gpM9PwKTYM5I20xroKhabgFk9PImANVDceL
 9XiG1vdgwsf6CCbBE62UAhvRPac03XtNlPlwUZaqZmARaao3/A5x+eMqD22q5amj
 bef0VcJxsrc0tpYo6DUTBrYO3jVYk+Bd4BspQquSc9vo4fkNV32pFa937PYNn8m4
 veHpMOX+z322opbZlc3rD8ltwUMW5xtTAbh0yjBzP+pS9fAbqXg9sfnGF9Hp20JH
 W1SiPRq3tJYbylQ45N4woHtguGWu3iROlysA4RwHg==
X-ME-Sender: <xms:U4LYYc_cudVWdG49GGuzyX5pMKrJcuSORpjUICdzo6X4N5Mkt-Lo4A>
 <xme:U4LYYUsaT1WOUm5vdSxWU01zOrgpUltdWF0-Ajf9BceWo0VwVmWiSbzRxGXgnuuin
 L95nUAWfJ-TX4YEFAE>
X-ME-Received: <xmr:U4LYYSDs0aKpBvv0p_HxGsJqc-EDK9H8T7k5fNklM0qByJo6C3hTpr9bCkbJC0JUnaPw4ixvyjP_vlbdxc-HCxYOQhCYJqsj645bDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudegvddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
 ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
 gtgidrgiihiieqnecuggftrfgrthhtvghrnhepvdeigeffkeehjefhteekveevhedvhfeu
 keetvefhkedvkeevudelgeefieffhffgnecuffhomhgrihhnpehgihhthhhusgdrtghomh
 dpmhgvmhgsvghrshhhihhpqdgrnhguqdhvohhtihhnghdrmhgupdhophgvnhgsmhgtqdhp
 rhhojhgvtghtrdighiiinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:U4LYYce16Z96QgPboLO3dNJaCQspvsYxjOdQpSYhvOAWH7jq3muoaQ>
 <xmx:U4LYYRP0inGq9O7SyX2c4hmGtNQ4hbgHrARL-oDyXBXOJt9xF217jQ>
 <xmx:U4LYYWma3SuGOB3DpozNx6XNRxwImG5gv0oDByGOkvrYhrRNrrBLNA>
 <xmx:VILYYYYrIvKRWu4SBpICDX6ma8aInnFHMqpaOHWR3D0rwnhmdTEjJw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Fri, 7 Jan 2022 13:11:31 -0500 (EST)
Date: Fri, 7 Jan 2022 12:11:30 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Upcoming TOF elections
Message-ID: <YdiCUiwh1iD4ycr8@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OAJvRzJcQKCZ+lIS"
Content-Disposition: inline
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--OAJvRzJcQKCZ+lIS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Greetings,

According to this document[1], the TOF should be holding elections starting=
 on
March 1st for seats starting April 1st.  There are activities that the curr=
ent
TOF is expected to do in order for those elections to be able to be held:

* Jan 15th: Current TOF must publish a list of eligible voting members.
* Jan 30th:	Nominations (self or peer) for TOF seats must be sent to the ma=
iling
            list.
* Jan 30th:	Developers disputing membership eligibility must submit a petit=
ion
            request to the current TOF.
* Feb 15th:	Current TOF must publish a final list of eligible voting members
            and upcoming candidates for TOF seats

Since this is the first election there are some tools that needed to be wri=
tten
in order to accomplish these tasks.  I've now finished the initial draft of=
 the
tools necessary to accomplish the Jan 15th deadline[2].

There are also some process items that the TOF is suppose to agree / publis=
h.
For those I have opened 3 TOF proposals for approval[3]:

- #7: Set "Highly Productive" threshold to 95 points for 2021H2
- #8: Accept tools for election data collection.
- #9: Accept 2022H1 rollcall

TOF members will need to move relative fast at deciding on these in order to
accomplish the Jan 15th deadline.  Please voice any concerns you may have o=
n any
of the TOF proposals to the mailing list (or a TOF member) quickly.

The most important data that people will want to see is the list of individ=
uals
who qualify for voting in the upcoming election.  The current draft (for
approval with issue #9) is found here[4].  If you are not found on the final
list and believe that you should be you may petition by Jan 30th by opening=
 a
separate issue to the issue list[3] with the evidence for your inclusion.


1. https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.md
2. https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/50200
3. https://github.com/openbmc/technical-oversight-forum/issues
4. https://github.com/williamspatrick/openbmc-tof-elections/blob/main/2022H=
1/rollcall.json

--=20
Patrick Williams

--OAJvRzJcQKCZ+lIS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHYglAACgkQqwNHzC0A
wRksLg/+MUrZ0LScLT56nLSjjflwPvC888oEtz0gJQX+Ae39pz4JQCTQXaVZUPRN
DeOBZWnt+sxvL059i8tEvEyGyccrnNZXENuvP/7poI1If38wIaiLKQnEoOKm8GX/
JP6n8OR5vCkySQjx3n//oWntPrAE/CX/yRb36wtNaCkNTznqg+RH8RbtwqQWTfuF
88MlLxyOHUiDdOdOY8847D6lE4BMFPEddxwhEFbz4AfYxIgs2jv83rBQPZwcLMKK
n4mBP5IBIVZp9qu4jXlUJSwQ7Ct4bAK42tqOGDnDIp/IG0gC3ZUhQd9D6lXMuDeL
EMSdcQHyquFlSJPDDG/n4q1wTfge+cbD3WO2qu9ZBFine6047QyJmbUxy0El8CAu
lAVFQ/iwoeMW+Nsg1fl70l0CNme9rAgmXPIIQXAMkOIxccPv2M5c3nQdS5WXhGs8
PzRo/DSjvAoW4PWuU1gipC0qf5TlyrmYA4HlWFMjUInCTpFrcfPyBAbgW9wdQnVH
5vTFG0u30UJ4WHEXJJY0YGU9rAZzrqTRTzDwFK1iQ+bigSm2/gbtr9Y2ZBHOowBE
vGbqYbWWua8ZaQYSmH2iZCdQOTpwkDRyhn9/zjBw48gTC3PKoEZHIY29LJ0rr4uV
dmd8Vyoq8XKIrt7rGHClB5V8htroQnSXT8lOH51tuFVrMeQvoUY=
=A5Zc
-----END PGP SIGNATURE-----

--OAJvRzJcQKCZ+lIS--
