Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3B62E6A00
	for <lists+openbmc@lfdr.de>; Mon, 28 Dec 2020 19:29:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D4R0b0DCNzDqCb
	for <lists+openbmc@lfdr.de>; Tue, 29 Dec 2020 05:29:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=uYR50uA4; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D4Qzw57NJzDqC3
 for <openbmc@lists.ozlabs.org>; Tue, 29 Dec 2020 05:28:57 +1100 (AEDT)
Received: by mail-yb1-xb36.google.com with SMTP id b64so10409591ybg.7
 for <openbmc@lists.ozlabs.org>; Mon, 28 Dec 2020 10:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cAKnDqxbsbRlwlSUB+TppYgvuhRtVKzwwPpL5mgqIg0=;
 b=uYR50uA4vcUBjEhalowiM70JMdpOEtsfasqwabeqNwXtK6tXEWXU1g2NGdJCi4diwT
 i0m4qQZJ6Lyik4CgyKOEP5U8qZAt8NieClpm4pRjB+0G4z84eYyeOl7Xb2++XS9qFSg3
 YG7A9c2HoDj6RHiB3XH0de5mY6HSukSR5SJjauUkPowDr5sF/lQt3bAEM64y/HVaqHcj
 YwAGlTgyQuaazb5ecYVvHF7SAK2zWjyVpGdL72d3E4uMa44rWIRY/67SnDPvFZxzWM6Y
 18inrGTYSavPtVOPJmSd80A/CZJUEjPsKPb/9ml+3bP0j6g2fVgg9TGLhfxbcu1Fe9/q
 4dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cAKnDqxbsbRlwlSUB+TppYgvuhRtVKzwwPpL5mgqIg0=;
 b=CgsCOjZVWY5zjuYXL9vAjFJL33vesZf69OhjqGz1PiAe+E9PuWQq9ACiGU9puTd5uZ
 WRlwPoF6BLjH9eW4eqaB5XWho5ViooNPTnFw9MtXsiS/i4Xm30IL/9bRa0u2jXwej1lQ
 nDHngt/E0zxlQPzDZ6mZoMab17rQ/lgMwHaPTDfrPnt5GpnyiA7G+KPwAiMsUuobFG8A
 WNQfBMsnPvzWSm7Dt87EhsnecFTu94Hlk8uCFioQ8AT9sl4nR8W93YntdLQFv9f7nQUi
 cecinTunbceQpd4W9FQHQPdOBP/6YYvTdJP+UUeoo6NCVF4J0qEF7AC3ct4vzyD+ka18
 uLSA==
X-Gm-Message-State: AOAM532Tu40SpGaCtZWRe3SrWNs2cojtXZTj8xdrEA10X05RMw0TC79G
 Lko6GfnhmEmo1IIgmitLjuW8h9wuycItf2GKXlq5mi45F63Oug==
X-Google-Smtp-Source: ABdhPJzk+voyrJCcaxMHCIiVGVZSSIKti26mio7WcwFp1ia1ryHEWQPALT10bhWZLLNMLHIR3W55eBR+IT/rk1cLcjE=
X-Received: by 2002:a25:7108:: with SMTP id m8mr50507808ybc.209.1609180132998; 
 Mon, 28 Dec 2020 10:28:52 -0800 (PST)
MIME-Version: 1.0
References: <TYZPR04MB4416F10FB143300652DAF8E286D90@TYZPR04MB4416.apcprd04.prod.outlook.com>
In-Reply-To: <TYZPR04MB4416F10FB143300652DAF8E286D90@TYZPR04MB4416.apcprd04.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 28 Dec 2020 10:28:40 -0800
Message-ID: <CACWQX82esvMYwAdGpSkb+EX0d8g+C84cFUU0oCDe6Kca4rfNKw@mail.gmail.com>
Subject: Re: [entity-manager]Should I add min,max to legacy.json?
To: =?UTF-8?B?U2Nyb24gQ2hhbmcgKOW8teS7suW7tik=?= <Scron.Chang@quantatw.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 28, 2020 at 5:57 AM Scron Chang (=E5=BC=B5=E4=BB=B2=E5=BB=B6)
<Scron.Chang@quantatw.com> wrote:
>
> Hi all,
>
>   In my case, lots of dbus-sensors/PSUSensor are using. Refer to the hint=
 in PSUSensorMain.cpp L576 to define the value of maximum/minimum, lots of =
objects like vout1_max, iout1_min=E2=80=A6 are defined in my configuration =
file. Even though it works (check by ipmitool sensor command), this json da=
ta can't pass to entity-manager/scripts/validate-configs.py. The reason sho=
uld be there are no objects of PSU sensors' maximum and minimum in entity-m=
anager/schema/legacy.json. Should I directly add those maximum and minimum =
objects to schema/legacy.json and submit schema/legacy.json to upstream?

I missed this in a recent code review to dbus sensors (I thought that
interface already existed);  Yes, please do the above.

>
> Ref: https://github.com/openbmc/dbus-sensors/blob/23c96e7c249b41efecc10ba=
7acba82603a54b996/src/PSUSensorMain.cpp#L576
>
> I would appreciate any suggestions.
>
> Scron Chang
> E-Mail  Scron.Chang@quantatw.com
> Ext.    11936
>
