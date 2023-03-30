Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D18416D1655
	for <lists+openbmc@lfdr.de>; Fri, 31 Mar 2023 06:26:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnnL93d64z3fQp
	for <lists+openbmc@lfdr.de>; Fri, 31 Mar 2023 15:26:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vvdntech.in header.i=@vvdntech.in header.a=rsa-sha256 header.s=google header.b=b4RWHQ+V;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vvdntech.in (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=aswath.s@vvdntech.in; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vvdntech.in header.i=@vvdntech.in header.a=rsa-sha256 header.s=google header.b=b4RWHQ+V;
	dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnB191WWrz3bjY
	for <openbmc@lists.ozlabs.org>; Thu, 30 Mar 2023 15:54:50 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id t19so17351621qta.12
        for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2023 21:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vvdntech.in; s=google; t=1680152087; x=1682744087;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aNiGRbdl9w64lak3U0GvoPoTUgREASKXmCmmbAzbtNw=;
        b=b4RWHQ+V0zv10Vx+WZ0Vn0QWpeo1VT70s+iRdR5LxEdMRMq7qK9+Fx88HG96WaZphp
         eo5kFLMkIT1XnU4pFLccDK7jELDBFjsVO0hG+l4x8b3ssjivcQxzihkOKNBtXFfN0YqV
         sATmrHhTiemSzGZafVSk13MZowoPdNjZz8wjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680152087; x=1682744087;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aNiGRbdl9w64lak3U0GvoPoTUgREASKXmCmmbAzbtNw=;
        b=kVzJRQId967l2eLqZ0DNOhcKjCV32wX2X1/3akRrpiXOl0LZXirOpkrBwb2r/5sHro
         4x09slIwK/Dcsd+D7PZc7DhSH9FNo5nlojcJInhZ8urlIwCJtQYw4OZif/RRNpzGEfpM
         aA9nCeshmWGUCD/5ljcEwcqB7Y6YtMyJTICJ01fRLpNpIokzACz2bjb++9c2JQrNDf9t
         6SfJ46EUMn/5TKEVIX1C5YpWbGQqBRspZXWqc/FoSs5RNEncgk2mWffFB133Wsl+QOid
         OKgDwhGGJyiFsQH/ZPwyHMgJZ0RyBuJi/oMiVPNuFl8XAQPeFp3OXHMz51TcJY63rZaG
         P8MA==
X-Gm-Message-State: AO0yUKX/RKeuk3sdKbdd6cT1atdLnN1T9QHSmwG4vGH40GJ5uuMbCELq
	yVylaJSbTEWwjFugV90uUAZzA9oG+GwhOcJI7duy/Dq6AlUJhSeL6Ji97A89V9OsWp82RyXI0qR
	AkaHTAD1xt4sxXmp8ZHNdxvtzUsI1L+agG6b0Kik=
X-Google-Smtp-Source: AK7set+oSQCWaEgOj3IhexCdWhg6XCzavezKE/21Q3x54pbt1vWvBoTVRMjkmrOTknXiM6nkJFtxoEB5B65HjPk7GoY=
X-Received: by 2002:ac8:7c48:0:b0:3e2:dd92:6d27 with SMTP id
 o8-20020ac87c48000000b003e2dd926d27mr8463941qtv.9.1680152086804; Wed, 29 Mar
 2023 21:54:46 -0700 (PDT)
MIME-Version: 1.0
From: Aswath S <aswath.s@vvdntech.in>
Date: Thu, 30 Mar 2023 10:24:10 +0530
Message-ID: <CAK0X4mMqj98OTk23bcsEqZ9BBCqVpjxpVRLp-PrBmNU2ZW1MYw@mail.gmail.com>
Subject: Host Interface || OpenBmc Project
To: openbmc@lists.ozlabs.org, jiaqing.zhao@linux.intel.com
Content-Type: multipart/alternative; boundary="0000000000004d943005f816e455"
X-Mailman-Approved-At: Fri, 31 Mar 2023 15:26:14 +1100
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

--0000000000004d943005f816e455
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi ,
I am new to this openbmc project and I have to enable redfish host interfac=
e
support. I have gone through many websites like github, stackoverflow
etc... Kindly guide or provide instructions to enable Redfish host
interface support in openbmc project.
--=20
With Best Regards
Aswath S
VVDN Technologies Pvt Ltd
Cell: +91 98945 29918
Web: www.vvdntech.com

--=20
_Disclaimer:=C2=A0_=C2=A9 2023 VVDN Technologies Pvt. Ltd. This e-mail cont=
ains=20
PRIVILEGED AND CONFIDENTIAL INFORMATION intended solely for the use of the=
=20
addressee(s). If you are not the intended recipient, please notify the=20
sender by e-mail and delete the original message. Further, you are not to=
=20
copy, disclose, or distribute this e-mail or its contents to any other=20
person and any such actions are unlawful.
__
_
_
_
_

--0000000000004d943005f816e455
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi ,<div>I am new to this openbmc project and I have to en=
able redfish host interface<br clear=3D"all"><div>support. I have gone thro=
ugh many websites like github, stackoverflow etc... Kindly guide or provide=
 instructions to enable Redfish host interface support in openbmc project.<=
/div><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" =
class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"lt=
r"><div>With Best Regards</div><div>Aswath S</div><div>VVDN Technologies Pv=
t Ltd</div><div>Cell: +91 98945 29918</div><div>Web: <a href=3D"http://www.=
vvdntech.com" target=3D"_blank">www.vvdntech.com</a></div><div><br></div></=
div></div></div></div>

<br>
<div><i style=3D"font-family:georgia,serif;font-size:small;color:rgb(80,0,8=
0)">Disclaimer:=C2=A0</i><i style=3D"font-family:georgia,serif;color:rgb(80=
,0,80);font-size:12px;text-align:justify">=C2=A9 2023 VVDN Technologies Pvt=
. Ltd. This e-mail contains PRIVILEGED AND CONFIDENTIAL INFORMATION intende=
d solely for the use of the addressee(s). If you are not the intended recip=
ient, please notify the sender by e-mail and delete the original message. F=
urther, you are not to copy, disclose, or distribute this e-mail or its con=
tents to any other person and any such actions are unlawful.</i><br></div><=
div><i style=3D"font-family:georgia,serif;background-color:rgb(255,255,255)=
;color:rgb(80,0,80);font-size:12px;text-align:justify"><br></i></div><div><=
i style=3D"font-family:georgia,serif;background-color:rgb(255,255,255);colo=
r:rgb(80,0,80);font-size:12px;text-align:justify"><br></i></div>
--0000000000004d943005f816e455--
