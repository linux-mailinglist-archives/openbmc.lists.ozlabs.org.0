Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F45926C8
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 16:34:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BxJM2kpgzDqFB
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 00:34:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c36; helo=mail-yw1-xc36.google.com;
 envelope-from=james.mihm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pq6T6n1t"; 
 dkim-atps=neutral
Received: from mail-yw1-xc36.google.com (mail-yw1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Bx786tKTzDqF1
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 00:26:12 +1000 (AEST)
Received: by mail-yw1-xc36.google.com with SMTP id f187so820542ywa.5
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 07:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R2RBjYs+rLjU8d3vZfBqYo9KrFKPlhcOW93pjUUafjk=;
 b=pq6T6n1tkBuEITW3H6sgU48GUBiFbkBTJmeO/7eB/Dqn/XEbyWFjGVbmj6cVBIcrip
 zOd5lWKBmU3cflnWmkqHcJP+oY/8Ocqqwy/F5jNl/pLHACYKuPj6xjULBPOQjUtCHs5U
 wdb2IAoVfDCNMqLkkSOLznvw5XdVLENVlUDBn4TiL8fREJD5n6vL0zLIwdfvQOTlQ5pk
 W3geFWTqGJU+a8vsyV+0RF/ryHul8XL5sa4E2NjWCDJkF/gU/LAF2ir68RB5qyKNh042
 npGFUYfV4N/BxrDMJ5AFH+P73azzH2XI/+o8qQ21ft9LBgckLUl8mKh4eGNOAUxzYwN/
 l1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R2RBjYs+rLjU8d3vZfBqYo9KrFKPlhcOW93pjUUafjk=;
 b=RJBst1TamT3BptDdBnaumKVfjHLQ6nbO6ly+OZS5ML9R06VVspDCmTCyvR3bTnpyrj
 nMYB6PLyNoXEGIZsfhyVORUafB01YhDFl1L+xmOLD6rGAv2Wo4lR0yLsx6xSToXBL0kQ
 mR4v05ycqD/7jWvcz67EgdyrMt73TrP+7OrH0v/sWjoh8wCVuG6hFDXlMnVW1Aoq9syq
 aej4WD4nio9ADBOQthLdTfrF0Fyfnolb9oj6CeoRGSdwhpf3BWx+8ua6KceknpbviVt8
 LQpBh8PtngVa4w5IzOLG3VhS+32PdVlPPNYd7TqJ4rBLkkdUIHx3vpLIQ0+LV3Tw1kmY
 wGpw==
X-Gm-Message-State: APjAAAW/DcjY/gLALHzM1h4Ig8cgNnAGYp8Vy6dw8FoHEsdGGqzccThK
 UlIKjUoXqVWNk9qytBdZDslj4uZqkiNTB22HWGc=
X-Google-Smtp-Source: APXvYqxp/llUa6f++fRma1/6tCB1Yd7UhZ9i8idQdF+s4mvecOZeyt0AirJf6vyAS2oI0vCEtfcUAVj3QGLY7bxDkfA=
X-Received: by 2002:a0d:c985:: with SMTP id
 l127mr16510479ywd.332.1566224769097; 
 Mon, 19 Aug 2019 07:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <MN2PR04MB5839D33826EF08A499E32167CDA80@MN2PR04MB5839.namprd04.prod.outlook.com>
In-Reply-To: <MN2PR04MB5839D33826EF08A499E32167CDA80@MN2PR04MB5839.namprd04.prod.outlook.com>
From: James Mihm <james.mihm@gmail.com>
Date: Mon, 19 Aug 2019 07:25:32 -0700
Message-ID: <CADy_Pt3tvAci8tXuZ3cTJY3tRxwnWPbD=yNL05VEYrjZKWcpEw@mail.gmail.com>
Subject: Re: Socflash says the bmc is write protected.
To: Zheng Bao <fishbaoz@hotmail.com>
Content-Type: multipart/alternative; boundary="0000000000000025d70590791fb6"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000000025d70590791fb6
Content-Type: text/plain; charset="UTF-8"

The P2A Bridge that is used by the socflash utility has been disabled; see
https://nvd.nist.gov/vuln/detail/CVE-2019-6260 for details.

On Mon, Aug 19, 2019 at 5:51 AM Zheng Bao <fishbaoz@hotmail.com> wrote:

> Hi, All,
> I use socflash to update the BMC firmware. The original BMC firmware can
> be updated, but openbmc can not be.
> Socflash says the BMC is protected. Does anybody know why?
>
> Thanks.
> Joe
>

--0000000000000025d70590791fb6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The P2A Bridge that is used by the socflash utility has be=
en disabled; see=C2=A0

<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2019-6260">https://nvd.nist=
.gov/vuln/detail/CVE-2019-6260</a>=C2=A0for details.</div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 19, 2019 at=
 5:51 AM Zheng Bao &lt;<a href=3D"mailto:fishbaoz@hotmail.com">fishbaoz@hot=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
Hi, All,</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
I use socflash to update the BMC firmware. The original BMC firmware can be=
 updated, but openbmc can not be.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
Socflash says the BMC is protected. Does anybody know why?</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
Thanks. <br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
Joe<br>
</div>
</div>

</blockquote></div>

--0000000000000025d70590791fb6--
