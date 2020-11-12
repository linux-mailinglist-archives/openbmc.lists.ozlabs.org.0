Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7905E2AFD99
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 05:01:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWnwB5G4bzDqyS
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 15:01:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=PJp80QDw; dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWnvJ6q0qzDqwW
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 15:00:40 +1100 (AEDT)
Received: by mail-ot1-x334.google.com with SMTP id j14so4361302ots.1
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 20:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QGXAIKSbhRaqvCQ0VRDuRLpMKBnDKZNfMFgRTgRghXg=;
 b=PJp80QDwWAIjISEtJx8lsH11nGNUJ2vlRpYFXhp4Id3QF9zfMHPpKIYEjn+0PHu3Lf
 4qYVa8q8fYvFPbzZmOJ+NLfivCstbZ47+RApExV5f8hEU5FTxtkpa6NGkCXXf/r0ng2B
 qm3Na5IT6/0V1fk2JUuNsjk0udAjRm16WsM9Hd1sYVUQRlAW1H2VgIa/sImpw+LCr2rb
 2QTESpr6oEtOvM2DwHNT3YZN22Du9KEDOdBDdCPAHqZTSULBCmNPmxJ+2To9MRfrxMQx
 f7kDNmhUWWU2C+bsiQO/jqVbFdeSgu19yWl+M40xtaZwgpOYThaEQn00o9wv+UHn8B7N
 yszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QGXAIKSbhRaqvCQ0VRDuRLpMKBnDKZNfMFgRTgRghXg=;
 b=oqkodOCjO71i4Qiz+vq2ksbkU5PxaZkluluf7sm4CgAFvt8NvXCx6P88cgec7F2Gxz
 DqtousNl0VPQ3yxNZPHgsk9jjVwE5D2E2YpfDaf5bKzN/xEZEr7GZQP+rkRm3aB+k4C7
 RXCbFXNg2YwSzM/vhlpgV3kIfYU2rA95LaIb3wTWYYGF6M7rkP8exP8drSiOo3tGyCxF
 OQFFJzU+Oe9Qitag1TeV1pl1cFBk9JCOIc9RaPQERBcqdNhrCxYAq1fWWTdhqtQfOlqj
 I1HXtr/VUr4RRbPQ7WNn0gvQVZimH1ufUNlNeJ1JdwZ2mk+uEbuEjkAEqfnIR1djaffp
 mLCA==
X-Gm-Message-State: AOAM531J4ayxM2t5x6pByV49ypmBNd3DRzbJGUtfCobA8JQ4KHEevCF8
 LYMG8tYzsJzNWi1f62Ljdevoqm9dV7BVVABnNGD+KA==
X-Google-Smtp-Source: ABdhPJx+N3JDyqT0aozd+5/7CJS6fPV//TgUVoRWsFI9hW6tE0eFRV40WUBsA8bu2TmPGDYqkjkrkx1DztUpT1ZYgkI=
X-Received: by 2002:a9d:754f:: with SMTP id b15mr9863137otl.349.1605153636670; 
 Wed, 11 Nov 2020 20:00:36 -0800 (PST)
MIME-Version: 1.0
References: <8da567c0-b5a4-47c0-90d6-d2de96ae99e5.moyan.yyb@alibaba-inc.com>
 <CADy_Pt3ukjs64bRkuEBB699cuvNadzatsBmQ_prSWWTokB0uhQ@mail.gmail.com>
 <beb7063a-f3ff-1de0-130e-0f98c3f35729@gmail.com>
 <32fea865-04f1-4927-bb3e-77d650098d28.moyan.yyb@alibaba-inc.com>
 <964928d9-3751-3a7e-7b06-fe35d238cb9f@gmail.com>
 <ff0d48dc-d51f-4f25-ab0b-feeec2783454.moyan.yyb@alibaba-inc.com>
In-Reply-To: <ff0d48dc-d51f-4f25-ab0b-feeec2783454.moyan.yyb@alibaba-inc.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 12 Nov 2020 12:00:25 +0800
Message-ID: <CAGm54UF_iHzsfQ0UAK3DOK1ku8KZE2ThVGfK2BEq8YdZrpbapA@mail.gmail.com>
Subject: Re: I just want to join the openbmc developer community
To: =?UTF-8?B?5p2o5YuH5YW1KOacq+WyqSk=?= <moyan.yyb@alibaba-inc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?B?5p2O5b+X5YW1KOi+ueiNkik=?= <zhibing.lzb@alibaba-inc.com>,
 =?UTF-8?B?5p2O576/KOS5ieWkqSk=?= <yitian.ly@alibaba-inc.com>,
 James Mihm <james.mihm@gmail.com>, krtaylor <kurt.r.taylor@gmail.com>,
 =?UTF-8?B?5bi455CzKOeJueedvyk=?= <terui.cl@alibaba-inc.com>,
 openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I would suggest to use https://lore.kernel.org/openbmc to search the
history mails for "new repo meta", and you could see how the new repos
are created.

E.g. https://lore.kernel.org/openbmc/8bd419da20bdfad6fc003145b15db3fb6c24e3=
7d.camel@fuzziesquirrel.com/

On Thu, Nov 12, 2020 at 7:49 AM =E6=9D=A8=E5=8B=87=E5=85=B5(=E6=9C=AB=E5=B2=
=A9) <moyan.yyb@alibaba-inc.com> wrote:
>
> Hi James & krtaylor=EF=BC=8C
>     Firstly i want to create a directory named "meta-alibaba" which under=
 the openbmc, but i can't know how to create it even i have readed the  htt=
ps://github.com/openbmc/docs/blob/master/CONTRIBUTING.md:  while i am readi=
ng CONTRIBUTING.md, i know  all meta-* layers are separate repositories.so =
if i want to create a layer named met-alibaba and it means i should create =
a repository first, but i can not find how to create it, or i have no  auth=
ority =EF=BC=9F   can you help me?
> Thanks.
>
>
>
>
>
> ------------------------------------------------------------------
> =E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9Akrtaylor <kurt.r.taylor@gmail.com>
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4=EF=BC=9A2020=E5=B9=B411=E6=9C=884=E6=
=97=A5(=E6=98=9F=E6=9C=9F=E4=B8=89) 21:42
> =E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A=E6=9D=A8=E5=8B=87=E5=85=B5(=E6=9C=AB=
=E5=B2=A9) <moyan.yyb@alibaba-inc.com>
> =E6=8A=84=E3=80=80=E9=80=81=EF=BC=9AJames Mihm <james.mihm@gmail.com>; =
=E5=B8=B8=E7=90=B3(=E7=89=B9=E7=9D=BF) <terui.cl@alibaba-inc.com>; openbmc =
<openbmc@lists.ozlabs.org>; =E6=9D=8E=E7=BE=BF(=E4=B9=89=E5=A4=A9) <yitian.=
ly@alibaba-inc.com>; =E6=9D=8E=E5=BF=97=E5=85=B5(=E8=BE=B9=E8=8D=92) <zhibi=
ng.lzb@alibaba-inc.com>
> =E4=B8=BB=E3=80=80=E9=A2=98=EF=BC=9ARe: =E5=9B=9E=E5=A4=8D=EF=BC=9AI just=
 want to join the openbmc developer community
>
> On 11/4/20 3:21 AM, =E6=9D=A8=E5=8B=87=E5=85=B5(=E6=9C=AB=E5=B2=A9) wrote=
:
> > Hi James & krtaylor=EF=BC=8C
> >      Here is the CCLA, and please help to check=E3=80=82
> > Thanks.
>
> Your CCLA has been accepted, welcome Alibaba!
>
> Kurt Taylor (krtaylor)
>
> >
> >
> >     ------------------------------------------------------------------
> >     =E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9Akrtaylor <kurt.r.taylor@gmail.c=
om>
> >     =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4=EF=BC=9A2020=E5=B9=B410=E6=9C=
=8828=E6=97=A5(=E6=98=9F=E6=9C=9F=E4=B8=89) 23:51
> >     =E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9AJames Mihm <james.mihm@gmail.co=
m>; =E6=9D=A8=E5=8B=87=E5=85=B5(=E6=9C=AB=E5=B2=A9)
> >     <moyan.yyb@alibaba-inc.com>
> >     =E6=8A=84 =E9=80=81=EF=BC=9A=E5=B8=B8=E7=90=B3(=E7=89=B9=E7=9D=BF) =
<terui.cl@alibaba-inc.com>; openbmc
> >     <openbmc@lists.ozlabs.org>; =E6=9D=8E=E7=BE=BF(=E4=B9=89=E5=A4=A9) =
<yitian.ly@alibaba-inc.com>;
> >     =E6=9D=8E=E5=BF=97=E5=85=B5(=E8=BE=B9=E8=8D=92) <zhibing.lzb@alibab=
a-inc.com>
> >     =E4=B8=BB =E9=A2=98=EF=BC=9ARe: I just want to join the openbmc dev=
eloper community
> >
> >     On 10/27/20 9:02 PM, James Mihm wrote:
> >      > Welcome Moyan,
> >      >
> >      > If you plan to contribute code, please download and complete the=
 CCLA at
> >      > https://github.com/openbmc/openbmc/files/1860741/OpenBMC.CCLA.pd=
f, and
> >      > mail to this mailing list.
> >      > Then those developers listed in the CLA will be able to submit c=
ode
> >      > changes. See https://github.com/openbmc/docs/blob/master/CONTRIB=
UTING.md
> >      > for more information.
> >      >
> >      > There are several workgroups for the project that you can partic=
ipate
> >      > with. See https://github.com/openbmc/openbmc/wiki for more infor=
mation.
> >      >
> >      > James.
> >      >
> >
> >     Thanks James, my simplistic filters missed this email.
> >
> >     Moyan, feel free to contact me if you have any questions with the C=
CLA.
> >
> >     Kurt Taylor (krtaylor)
> >
> >      >
> >      > On Tue, Oct 27, 2020 at 6:31 PM =E6=9D=A8=E5=8B=87=E5=85=B5(=E6=
=9C=AB=E5=B2=A9) <moyan.yyb@alibaba-
> >     inc.com
> >      > <mailto:moyan.yyb@alibaba-inc.com>> wrote:
> >      >
> >      >     Hi=EF=BC=8C
> >      >          my name is moyan,who is  workinig for alibaba company. =
 My
> >      >     compay just want to join the openbmc developer community, an=
d i have
> >      >     subscribed to openbmc by accessing the website of
> >      >     "https://lists.ozlabs.org/listinfo/openbmc".So, what should =
i do next?
> >      >
> >      >     Thank you.
> >      >
> >      >
> >      >     ------------------------------------------------------------=
-------------------------
> >      >     =E6=9D=A8=E5=8B=87=E5=85=B5=EF=BC=88=E6=9C=AB=E5=B2=A9=EF=BC=
=89
> >      >     =E5=9F=BA=E7=A1=80=E6=9E=B6=E6=9E=84=E4=BA=8B=E4=B8=9A=E7=BE=
=A4-=E8=AE=A1=E7=AE=97=E4=B8=8E=E5=AD=98=E5=82=A8=E4=BA=8B=E4=B8=9A=E9=83=
=A8-=E6=9C=8D=E5=8A=A1=E5=99=A8=E4=BA=A7=E5=93=81
> >      >     =E9=82=AE=E7=AE=B1=EF=BC=9Amoyan.yyb@alibaba-inc.com <mailto=
:moyan.yyb@alibaba-
> >     inc.com>
> >      >     Mobil:182-6717-9546
> >      >     =E5=8A=9E=E5=85=AC=E5=9C=B0=E7=82=B9=EF=BC=9A=E6=B5=99=E6=B1=
=9F-=E6=9D=AD=E5=B7=9E-=E4=BD=99=E6=9D=AD-EFC=E8=8B=B1=E5=9B=BD=E4=B8=AD=E5=
=BF=8334=E6=A5=BC
> >      >     ------------------------------------------------------------=
-------------------------
> >      >     =E6=9C=AC=E9=82=AE=E4=BB=B6=E5=8F=8A=E5=85=B6=E9=99=84=E4=BB=
=B6=E5=90=AB=E6=9C=89=E9=98=BF=E9=87=8C=E5=B7=B4=E5=B7=B4=E9=9B=86=E5=9B=A2=
=E7=9A=84=E5=95=86=E4=B8=9A=E7=A7=98=E5=AF=86=E4=BF=A1=E6=81=AF=EF=BC=8C=E4=
=BB=85=E9=99=90=E4=BA=8E=E5=8F=91=E9=80=81=E7=BB=99=E4=B8=8A
> >     =E9=9D=A2=E5=9C=B0=E5=9D=80=E4=B8=AD
> >      >     =E5=88=97=E5=87=BA=E7=9A=84=E4=B8=AA=E4=BA=BA=E5=92=8C=E7=BE=
=A4=E7=BB=84=EF=BC=8C=E7=A6=81=E6=AD=A2=E4=BB=BB=E4=BD=95=E5=85=B6=E4=BB=96=
=E4=BA=BA=E4=BB=A5=E4=BB=BB=E4=BD=95=E5=BD=A2=E5=BC=8F=E4=BD=BF=E7=94=A8=EF=
=BC=88=E5=8C=85=E6=8B=AC=E4=BD=86=E4=B8=8D=E9=99=90=E4=BA=8E
> >     =E5=85=A8=E9=83=A8=E6=88=96=E9=83=A8
> >      >     =E5=88=86=E5=9C=B0=E6=B3=84=E9=9C=B2=E3=80=81=E5=A4=8D=E5=88=
=B6=E6=88=96=E6=95=A3=E5=8F=91=EF=BC=89=E6=9C=AC=E9=82=AE=E4=BB=B6=E5=8F=8A=
=E5=85=B6=E9=99=84=E4=BB=B6=E4=B8=AD=E7=9A=84=E4=BF=A1=E6=81=AF=EF=BC=8C=E5=
=A6=82=E6=9E=9C=E6=82=A8=E9=94=99=E6=94=B6=E6=9C=AC=E9=82=AE
> >     =E4=BB=B6=EF=BC=8C=E8=AF=B7=E6=82=A8
> >      >     =E7=AB=8B=E5=8D=B3=E7=94=B5=E8=AF=9D=E6=88=96=E9=82=AE=E4=BB=
=B6=E9=80=9A=E7=9F=A5=E5=8F=91=E4=BB=B6=E4=BA=BA=E5=B9=B6=E5=88=A0=E9=99=A4=
=E6=9C=AC=E9=82=AE=E4=BB=B6=E3=80=82
> >      >     This email and its attachments contain confidential informat=
ion from Alibaba Group, which is intended only for the person or entity who=
se address is listed above. Any use of information contained herein in any =
way (including, but not limited to, total or partial disclosure, reproducti=
on or dissemination) by persons other than the intended recipient(s) is pro=
hibited. If you receive this email in error, please notify the sender by ph=
one or email immediately and delete it.
> >      >
> >      >
> >
>
>


--=20
BRs,
Lei YU
