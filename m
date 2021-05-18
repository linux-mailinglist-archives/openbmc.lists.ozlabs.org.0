Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B2B387FF3
	for <lists+openbmc@lfdr.de>; Tue, 18 May 2021 20:52:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fl4qc4vpBz301m
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 04:52:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=uRWetO0k;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630;
 helo=mail-ej1-x630.google.com; envelope-from=asmithakarun@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uRWetO0k; dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fl4qL6vFdz2yXC
 for <openbmc@lists.ozlabs.org>; Wed, 19 May 2021 04:51:57 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id u21so16143320ejo.13
 for <openbmc@lists.ozlabs.org>; Tue, 18 May 2021 11:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Wt4X5e2w2sUvvC3GduImx5+GCOyEojXIKZO1+W9G0KA=;
 b=uRWetO0kFv7EiNaC/eGFacz3U3HhSd9uNm+kKCV/qOMWWoMVjPOXn0ACYkxPsDM6Ex
 FiRYkisW8Effe0ElSZk1Byo+xSsvhSwMPtQBqfQfczxYjVusas3cEqcRdPAyewBchS9b
 1bS94gljutTnI7P7/lv65zrh/OHBKmOLi6B0HPABQDvV8utiNkrM71mhhWFJfcC3BoN3
 5wLOei58/uy9cElTEAgoqB2GhQt0EM5sltPJNF/Vq6ijvz0onTfQQgyc4UnqtuuPc48u
 1PN76JkIPhexasxSaXTWeyVeJ/hEOIlRB3MM24paLxeVbiUDQNnJe5zJg3sIfGCT+hq0
 taZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Wt4X5e2w2sUvvC3GduImx5+GCOyEojXIKZO1+W9G0KA=;
 b=bK6rpnjz0IGATz7/JWDi6I54cTtus8gnNO/ugku1HAkfpQ+Nyk+gyEkHt7JczWtvoY
 1ss47Cj2G/ih0yWMS14vV2GOO+soBg4w/BD+G9uKkm3SKh6thgdisgAlF+HCVSAg03LG
 CCuvvZqpZpZ4EoFbwE1ELMStSvgFRhRNTytq9Wvxm2lqE4H2IBEfLGjD8V9FXTZjH5dO
 7X8HRf0zjfBZMdqzRtqOmBtU32r03+cXl1XkTDjok7Pe6JsER9zsm8rCsmLQpwuPbWNz
 A3Sg7rHxUuJx3sOmFWR8Nk0uw2O5fgPBjs0YpW1G59ZskqUPG7kYSvFpkPDg2EBHAIDY
 NXBQ==
X-Gm-Message-State: AOAM530ohxD2FN49B2ebLwOu4XW87iX6OlTg3F1W/gZKGQnvxxDGepoI
 eijmv6Wumt964dmcJAjAEVVIj4SsQHkht7hpbw1JFXSG
X-Google-Smtp-Source: ABdhPJzunAGubv353PpNudJ7c/8Y9KB0RdWEaB1jEb8c9rRA/GS6/4pRpjSxCUgEoR/0bZhKBRIotg4ZOxWae8O0foU=
X-Received: by 2002:a17:906:a51:: with SMTP id
 x17mr7565552ejf.25.1621363911940; 
 Tue, 18 May 2021 11:51:51 -0700 (PDT)
MIME-Version: 1.0
From: Asmitha Karunanithi <asmithakarun@gmail.com>
Date: Wed, 19 May 2021 00:21:13 +0530
Message-ID: <CANGK-S43NcaBz-jpfe7hu_agETX87GsKqnzFUuN836eX0J-fWQ@mail.gmail.com>
Subject: Hi Patrick,
To: openbmc@lists.ozlabs.org, Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="00000000000005df7405c29f345b"
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
Cc: ed@tanous.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000005df7405c29f345b
Content-Type: text/plain; charset="UTF-8"

Continuing the discussion in discord here...

Why are we pushing something so Redfish specific down into the dbus
> objects?  (And why isn't it documented as such).  No BIOS that I know of
> has the concept of a "OwningEntity" like this, so they're not passing it
> down to us over PLDM/IPMI.  That means we have to hard code it (via
> configuration of some sort) in bios manager.  Why not just hard code it in
> redfish?


We thought if we can configure "who owns the bios" via pldm, since pldm is
having certain config data through which it creates the biostable.

"For why not redfish?" - I thought why keep registry-related data on
redfish, while the whole registry data is coming from the bios config mgr.
Might be the name here is not correct (owning entity) but we can keep some
relevant name for this field.

I am very much inline with having certain configuration-related data in
bios config mgr and hardcode the necessary data in that file. But even in
that case, these data should be hosted in a dbus object right.

So there can be 2 options: (where my initial thought was to go with option
2 here)
1. If it is "so" redfish specific, we can take it to some redfish
configuration file and read it from there
2. Have the config data in bios config mgr, and then the dbus properties
can be populated from this data.

This is an initial thought of mine, but I am still open to suggestions to
shape this commit in a correct way.

How do we handle BIOS settings which do not go through the
> BIOSConfig/Manager?  BIOSConfig/Manager was intended to hold free-form
> settings which the BMC doesn't want to make dbus objects for each one, but
> some of the BIOS settings come from existing dbus objects (ex. network
> config is one of them).

Patrick, I am not aware of certain bios settings that do not go through
bios config mgr. Can you please point me to that?
Because I think that is still going through bios config mgr, meaning even
if there are certain dbus objects, (network config in this case), the
properties of those dbus objects are being written into the bios config mgr
(so if we try to access the biostable, we will get those n/w attributes
also as a part of bios schema)
Please correct me if I am wrong.

How do we handle a system with multiple BIOSConfig/Manager objects?
> Previously I think there was just a single one, but with the concept of
> versions (and different owners) we're going to need to handle multiple of
> them.

If I am assuming correct, you are pointing out the case of a bladed system,
where there will be multiple BIOS vendors? In that case, each of the
systems will be having different system objects (with unique id) and each
of them will have their bios objects.

"but with the concept of versions (and different owners) we're going to
> need to handle multiple of them."

I am not following here.
In redfish, there is a concept of versioning and owner and we thought if we
can extend it here in the backend as well, which is the intent of adding
these two fields in this commit.

I will read up more on the redfish spec.

I think the version can be removed in my change (and leave it hardcoded
like it is being done currently) but I feel there should be an option to
define who is the "owner of bios", where we can mention the different
owners (vendors) of bios and also maybe, have the "name of the registry"
defined.
(again this goes back to the first point above).

Ed, your thoughts here would also be really helpful.

-- 
Thanks & Regards,
Asmitha Karunanithi

--00000000000005df7405c29f345b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Continuing the discussion in discord here...<br><br><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Why are we pushing something so=
 Redfish specific down into the dbus objects? =C2=A0(And why isn&#39;t it d=
ocumented as such).=C2=A0 No BIOS that I know of has the concept of a &quot=
;OwningEntity&quot; like this, so they&#39;re not passing it down to us ove=
r PLDM/IPMI.=C2=A0 That means we have to hard code it (via configuration of=
 some sort) in bios manager.=C2=A0 Why not just hard code it in redfish?</b=
lockquote><br>We thought if we can configure &quot;who owns the bios&quot; =
via pldm, since pldm is having certain config data through which it creates=
 the biostable.<br><br>&quot;For why not redfish?&quot; - I thought why kee=
p registry-related data on redfish, while the whole registry data is coming=
 from the bios config mgr. Might be the name here is not correct (owning en=
tity) but we can keep some relevant name for this field.<br><br>I am very m=
uch inline with having certain configuration-related data in bios config mg=
r and hardcode the necessary data in that file. But even in that case, thes=
e data should be hosted in a dbus object right.<br><br>So there can be 2 op=
tions: (where my initial thought was to go with option 2 here)<br>1. If it =
is &quot;so&quot; redfish specific, we can take it to some redfish configur=
ation file and read it from there<br>2. Have the config data in bios config=
 mgr, and then the dbus properties can be populated from this data.<br><br>=
This is an initial thought of mine, but I am still open to suggestions to s=
hape this commit in a correct way. <br><br><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">How do we handle BIOS settings which do not go through th=
e BIOSConfig/Manager?=C2=A0 BIOSConfig/Manager was intended to hold free-fo=
rm settings which the BMC doesn&#39;t want to make dbus objects for each on=
e, but some of the BIOS settings come from existing dbus objects (ex. netwo=
rk config is one of them).</blockquote>Patrick, I am not aware of certain b=
ios settings that do not go through bios config mgr. Can you please point m=
e to that?<br>Because I think that is still going through bios config mgr, =
meaning even if there are certain dbus objects, (network config in this cas=
e), the properties of those dbus objects are being written into the bios co=
nfig mgr (so if we try to access the biostable, we will get those n/w attri=
butes also as a part of bios schema)<br>Please correct me if I am wrong.<br=
><br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">How do we handle a s=
ystem with multiple BIOSConfig/Manager objects?=C2=A0 Previously I think th=
ere was just a single one, but with the concept of versions (and different =
owners) we&#39;re going to need to handle multiple of them.</blockquote>If =
I am assuming correct, you are pointing out the case of a bladed system, wh=
ere there will be multiple BIOS vendors? In that case, each of the systems =
will be having different system objects (with unique id) and each of them w=
ill have their bios objects.<br><br><blockquote style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gm=
ail_quote">&quot;but with the concept of versions (and different owners) we=
&#39;re going to need to handle multiple of them.&quot;</blockquote>I am no=
t following here.<br>In redfish, there is a concept of versioning and owner=
 and we thought if we can extend it here in the backend as well, which is t=
he intent of adding these two fields in this commit.<br><br>I will read up =
more on the redfish spec.<div><br>I think the version can be removed in my =
change (and leave it hardcoded like it is being done currently) but I feel =
there should be an option to define who is the &quot;owner of bios&quot;, w=
here we can mention the different owners (vendors) of bios and also maybe, =
have the &quot;name of the registry&quot; defined.<br>(again this goes back=
 to the first point above).<br><br>Ed, your thoughts here would also be rea=
lly helpful.<br><div><br></div>-- <br><div dir=3D"ltr" data-smartmail=3D"gm=
ail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Thanks &amp; Regards,=
<div>Asmitha Karunanithi</div></div></div></div></div></div></div>

--00000000000005df7405c29f345b--
