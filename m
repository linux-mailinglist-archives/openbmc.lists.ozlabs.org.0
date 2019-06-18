Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 058554A5F6
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 17:56:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45St4M5QXJzDqgs
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 01:56:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="p3U2Preb"; 
 dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45St3d5MQFzDqXg
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 01:56:12 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id x32so1985866ybh.1
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 08:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GQBF/wPi+8xkKm7KTMg6NFNAJrYbW2RBcy56U79R1Wg=;
 b=p3U2Prebk1u6HaqCsewWemLvKXOZ4QHwlRXAqtqwOTxAYyNQxfIAPT8OGNYO/L1LtH
 ReRnCEeydLit/Ba08w5V0YnSbDy2z6sg1NpGpwsVX8iicqG1Ad3qnA8IiJHxsCEm9XRQ
 Al14tJkjTFkUWWl8YJS6wzSJUBQywqTG4MVUV+O+B97KHE6cwbEyH1YciRSRwjizY4xH
 iVsjT9p6t1fVvJFa0jG2XllS9wb1ahL7cAWkCD83o4z5WLJKD5NAKSukf5N6usy0ctFz
 Vg/nRXXihCZzXIK5A1WdP79UMWKAENBn0eQGmYd2rQ8wiTH7XkPsfJ4JbEsVbgZHArP4
 JIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GQBF/wPi+8xkKm7KTMg6NFNAJrYbW2RBcy56U79R1Wg=;
 b=g9jnZN8YRXju1a7sbr9+J+SA3JUM9Rp6LwqaVx6MS/ltzLLkv8wq+1Uvz/5kSZItho
 vvPzF2e77PNgxwPuWkvNsINvfIXmVFD95oFwbD6f3IViPbwbFTIxR89QxqPefRmS7afV
 MzK0HmiffCXFMtsVkeSL6F0k39UBVw4I5xQsM1nhgf8DEP04BqorpTEXnZfufD+KYMfY
 ph8B49rh69Fk0ia5gIPmbuNHIHyrf6vg73F5PprkA8tLVcFOcfQHmx5BSZ2cbIr04erU
 Gqi8vHJYj2Jy4xhxljJV8A8dQ4j/CMcXv0iUJpHPGqluRLr2r8ua+/pI0/utt3U46PYw
 rUzQ==
X-Gm-Message-State: APjAAAVhn3slc0G0valmVVeeO7bHWYrSyJxnD5dcpaPSIEdQY57pKdJ+
 exXGY3lF2SoCVnEH6W6vkvVe+2URTZmyTU4XIQI=
X-Google-Smtp-Source: APXvYqxrbL4qyM5ETDx06Y+a3etDryCIJdkRxNtY0xeoznfuOG0JClPw1cSo2eeH6D7bHCPV/b1KWolcthRb8K01UsQ=
X-Received: by 2002:a25:358b:: with SMTP id
 c133mr57371208yba.296.1560873369325; 
 Tue, 18 Jun 2019 08:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.3250.1560532343.4162.openbmc@lists.ozlabs.org>
 <tencent_69C7E9EC6F65C50D0F925BFF@qq.com>
 <CAOUmYFRYB3i_-sLBMbmOXJX3-Lo49QjfK2G01XFHbj4Mndx4sA@mail.gmail.com>
In-Reply-To: <CAOUmYFRYB3i_-sLBMbmOXJX3-Lo49QjfK2G01XFHbj4Mndx4sA@mail.gmail.com>
From: Jandra A <jandraara@gmail.com>
Date: Tue, 18 Jun 2019 10:55:58 -0500
Message-ID: <CAMTupoQ9fovzOcFH__Ljq=y8RKAp8_7WYunzQ8xNcc6Qjk+Dvg@mail.gmail.com>
Subject: Re: Re: Network Settings GUI
To: Derick <derick.montague@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b7d2b7058b9b26ef"
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
Cc: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b7d2b7058b9b26ef
Content-Type: text/plain; charset="UTF-8"

>
> IPV6 is one of the functions  urgently need by Lenovo Commercial Server
> Products.


We have a design that can be implemented, but we are not planning to
> implement IPv6 in the GUI right away based on our current priorities.


To provide a design to be implemented for supporting IPV6, we would also
need to know if the expectation and use case is for supporting both IPV4
and IPV6 on a single interface at the same time or if a user would have to
select one or the other. Once we have this information, we can provide a
design.



On Tue, Jun 18, 2019 at 10:51 AM Derick <derick.montague@gmail.com> wrote:

> > IPV6 is one of the functions  urgently need by Lenovo Commercial Server
> Products.
>
> Thank you for your response! What does urgent mean, is there a
> timeframe? Does your
> team have front-end development resources to implement the design? We
> have a design that can be implemented, but we are not planning to
> implement IPv6
> in the GUI right away based on our current priorities. If someone else
> wants to implement the design, we can review and provide feedback. I
> believe the backend functionality is complete.
>

--000000000000b7d2b7058b9b26ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">IPV6 is one of the functions=C2=A0 urgently need by Lenovo Comme=
rcial Server Products.=C2=A0</blockquote><br class=3D"gmail-Apple-interchan=
ge-newline"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">We have a des=
ign that can be implemented, but we are not planning to implement IPv6 in t=
he GUI right away based on our current priorities.</blockquote><div><br></d=
iv><div>To provide a design to be implemented for supporting IPV6, we would=
 also need to know if the expectation and use case is for supporting both I=
PV4 and IPV6 on a single interface at the same time or if a user would have=
 to select one or the other. Once we have this information, we can provide =
a design.=C2=A0</div><div><br></div><div>=C2=A0</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 18, 2019=
 at 10:51 AM Derick &lt;<a href=3D"mailto:derick.montague@gmail.com">derick=
.montague@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">&gt; IPV6 is one of the functions=C2=A0 urgently need by=
 Lenovo Commercial Server Products.<br>
<br>
Thank you for your response! What does urgent mean, is there a<br>
timeframe? Does your<br>
team have front-end development resources to implement the design? We<br>
have a design that can be implemented, but we are not planning to<br>
implement IPv6<br>
in the GUI right away based on our current priorities. If someone else<br>
wants to implement the design, we can review and provide feedback. I<br>
believe the backend functionality is complete.<br>
</blockquote></div></div>

--000000000000b7d2b7058b9b26ef--
