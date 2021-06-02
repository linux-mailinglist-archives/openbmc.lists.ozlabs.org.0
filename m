Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D7A398874
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 13:37:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw6TM48wHz301g
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 21:37:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=P30SnArb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f;
 helo=mail-ej1-x62f.google.com; envelope-from=61a91bc@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=P30SnArb; dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw6T56SgRz2yXX
 for <openbmc@lists.ozlabs.org>; Wed,  2 Jun 2021 21:37:27 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id ce15so3360460ejb.4
 for <openbmc@lists.ozlabs.org>; Wed, 02 Jun 2021 04:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=R1t+Vh/YZKaTGceACex/Zs+XVrko+WzviaSQc8zqCWc=;
 b=P30SnArbDzcpB4ULONWDdvk5fJCT67ftoPfe3ZXTs6UWSOPM8Yf4HmJDlGSLhio/vj
 OReAzWpo39eQEzttVC9UHeohfnj2VMjXIvgt0JBkvKKjEiXcocvFxOGlWRc6wigbKKKf
 n1t1jIIvxPAYp/480yr61mqAPEDPe9uV6EhU6MIIjqajzNFc4w4wsDjfBs7N0BuFC5yN
 qAN+GHveD/k+x0Ej4BitcsTc/hH1ykrwFdzhhVf9oFo8SqlfZ8UY/gO6yBkcqeZ1ks2k
 PIuGaIDEZUpWlWiie8ibhUinrUcWH5xUZT6WkfnNLy1wLgjDoDSmP4wqc3ShupVU8Boo
 Fhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=R1t+Vh/YZKaTGceACex/Zs+XVrko+WzviaSQc8zqCWc=;
 b=CyMtXOO9GICi5i2Bx5BoGJKUfvtYKFdsFfNf4Wk4vbA7kGrFNXX2JX6CpODrn3mCPG
 zC+xm9T4pDvfNY2bEy3rkzDJgd7Bnc6iBZGK7hqoyBWZjqfUikkLkqTftTa6R/t908Sp
 vZPviXc7sKk0TWNbynRI5OBoltUgiglERkzag88pagCuf9Va1azxtD+d4khMDxyYVGiI
 jft4iOYdApWj/It7g6znz/jP+mNBSpxznfTxCCuLxpOV8uy7N5EagbRROK5vcy4uV56t
 5Ra+9swB63uFKUxGhX6DKNfC7e4ot4DwiVPFQOv6WUp7gW9DJaeQr6d+8uO+/RH0wz/p
 45QQ==
X-Gm-Message-State: AOAM531kQa1lZZ7sFbLGe11hCU4+8oHb3sKS3/X6ZEJLXVDAEUmI/Ub+
 BdgZYRMOYNBh21LK8qwCXCeeR8kj6XjjrZ3t1sQMfOYdvt8=
X-Google-Smtp-Source: ABdhPJwVlRwKPnaAB/Z5WlmbGVhFCwWUiC79BYRZJ4wfPsF0jRvoe0L4fRf8/HwFRyn36VwoRqPeLsM81ZZI91VrzAo=
X-Received: by 2002:a17:906:31c6:: with SMTP id
 f6mr34127347ejf.446.1622633839351; 
 Wed, 02 Jun 2021 04:37:19 -0700 (PDT)
MIME-Version: 1.0
From: Alexander Raih <61a91bc@gmail.com>
Date: Wed, 2 Jun 2021 14:37:08 +0300
Message-ID: <CAMqwjCCONsvD8UUj6kcZEDcUFxXSE2EHVeL_8CMLyN_No3z65w@mail.gmail.com>
Subject: question about gpio in x86-power-control
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000985e5a05c3c6e146"
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

--000000000000985e5a05c3c6e146
Content-Type: text/plain; charset="UTF-8"

gpio-824 (RESET_BUTTON |power-control ) in hi IRQ


gpio-825 (RESET_OUT )


gpio-826 (POWER_BUTTON |power-control ) in hi IRQ


gpio-827 (POWER_OUT )


gpio-828 (NMI_BUTTON |power-control ) in hi IRQ


When I want to powerOn in web interface RESET_OUT and POWER_OUT should be
busy with power control service ??

--000000000000985e5a05c3c6e146
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"margin-top:0px;margin-right:0px;margin-left:0p=
x;padding:0px;border:0px;font-variant-numeric:inherit;font-variant-east-asi=
an:inherit;font-stretch:inherit;line-height:inherit;font-family:-apple-syst=
em,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Liberation Sans&quot;,sans=
-serif;font-size:15px;vertical-align:baseline;box-sizing:inherit;clear:both=
;color:rgb(36,39,41)">gpio-824 (RESET_BUTTON |power-control ) in hi IRQ</p>=
<p style=3D"margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;bor=
der:0px;font-variant-numeric:inherit;font-variant-east-asian:inherit;font-s=
tretch:inherit;line-height:inherit;font-family:-apple-system,BlinkMacSystem=
Font,&quot;Segoe UI&quot;,&quot;Liberation Sans&quot;,sans-serif;font-size:=
15px;vertical-align:baseline;box-sizing:inherit;clear:both;color:rgb(36,39,=
41)"><br></p><p style=3D"margin-top:0px;margin-right:0px;margin-left:0px;pa=
dding:0px;border:0px;font-variant-numeric:inherit;font-variant-east-asian:i=
nherit;font-stretch:inherit;line-height:inherit;font-family:-apple-system,B=
linkMacSystemFont,&quot;Segoe UI&quot;,&quot;Liberation Sans&quot;,sans-ser=
if;font-size:15px;vertical-align:baseline;box-sizing:inherit;clear:both;col=
or:rgb(36,39,41)">gpio-825 (RESET_OUT )=C2=A0=C2=A0</p><p style=3D"margin-t=
op:0px;margin-right:0px;margin-left:0px;padding:0px;border:0px;font-variant=
-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;line-=
height:inherit;font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&=
quot;,&quot;Liberation Sans&quot;,sans-serif;font-size:15px;vertical-align:=
baseline;box-sizing:inherit;clear:both;color:rgb(36,39,41)"><br></p><p styl=
e=3D"margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;border:0px=
;font-variant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:=
inherit;line-height:inherit;font-family:-apple-system,BlinkMacSystemFont,&q=
uot;Segoe UI&quot;,&quot;Liberation Sans&quot;,sans-serif;font-size:15px;ve=
rtical-align:baseline;box-sizing:inherit;clear:both;color:rgb(36,39,41)">gp=
io-826 (POWER_BUTTON |power-control ) in hi IRQ</p><p style=3D"margin-top:0=
px;margin-right:0px;margin-left:0px;padding:0px;border:0px;font-variant-num=
eric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;line-heig=
ht:inherit;font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot=
;,&quot;Liberation Sans&quot;,sans-serif;font-size:15px;vertical-align:base=
line;box-sizing:inherit;clear:both;color:rgb(36,39,41)"><br></p><p style=3D=
"margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;border:0px;fon=
t-variant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inhe=
rit;line-height:inherit;font-family:-apple-system,BlinkMacSystemFont,&quot;=
Segoe UI&quot;,&quot;Liberation Sans&quot;,sans-serif;font-size:15px;vertic=
al-align:baseline;box-sizing:inherit;clear:both;color:rgb(36,39,41)">gpio-8=
27 (POWER_OUT )</p><p style=3D"margin-top:0px;margin-right:0px;margin-left:=
0px;padding:0px;border:0px;font-variant-numeric:inherit;font-variant-east-a=
sian:inherit;font-stretch:inherit;line-height:inherit;font-family:-apple-sy=
stem,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Liberation Sans&quot;,sa=
ns-serif;font-size:15px;vertical-align:baseline;box-sizing:inherit;clear:bo=
th;color:rgb(36,39,41)"><br></p><p style=3D"margin-top:0px;margin-right:0px=
;margin-left:0px;padding:0px;border:0px;font-variant-numeric:inherit;font-v=
ariant-east-asian:inherit;font-stretch:inherit;line-height:inherit;font-fam=
ily:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Liberation =
Sans&quot;,sans-serif;font-size:15px;vertical-align:baseline;box-sizing:inh=
erit;clear:both;color:rgb(36,39,41)">gpio-828 (NMI_BUTTON |power-control ) =
in hi IRQ</p><p style=3D"margin:0px;padding:0px;border:0px;font-variant-num=
eric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;line-heig=
ht:inherit;font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot=
;,&quot;Liberation Sans&quot;,sans-serif;font-size:15px;vertical-align:base=
line;box-sizing:inherit;clear:both;color:rgb(36,39,41)"><br></p><p style=3D=
"margin:0px;padding:0px;border:0px;font-variant-numeric:inherit;font-varian=
t-east-asian:inherit;font-stretch:inherit;line-height:inherit;font-family:-=
apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Liberation Sans&=
quot;,sans-serif;font-size:15px;vertical-align:baseline;box-sizing:inherit;=
clear:both;color:rgb(36,39,41)">When I want to powerOn in web interface RES=
ET_OUT and POWER_OUT should be busy with power control service ??</p></div>

--000000000000985e5a05c3c6e146--
