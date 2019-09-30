Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E474C25E9
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 20:07:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hr301FtRzDqNP
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2019 04:07:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oMFo6EWN"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hr2N5tGyzDqM9
 for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2019 04:06:51 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id w12so12637194iol.11
 for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2019 11:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hkdxXcGhWs9pQ2Yvg+H2ec8IXdXWQO7Ew7jlJprnL8o=;
 b=oMFo6EWNhWBRJoev/lLggB/yVPHjzPuvV8559c3h1Zzdwy3CNZCPDMFCrjTUs01/TO
 apZ1suPlA/5okMiFgG5XK3DZBrCZKYfl6/AQiTJ87lGNDY0Ua9F9YYaBMfa1V+t9eBHj
 o0oIQc638iPI7i910f6LdPkloOl3F12YNziQnNOyjRDBSFQHM+E95SnHKbV/R7dq16e/
 Ob7vyPKNgZsCLloW6NssrFD0pAbRZwvKLjjhux5eGj07goU9wpeWLawLK20Pij07JOov
 z3A33+2thd1OAoUtrjlPAL1l8ylm6ITlPsxOxnKqhheKaVoljA+Xdt6ucuNd42a65yLL
 V3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hkdxXcGhWs9pQ2Yvg+H2ec8IXdXWQO7Ew7jlJprnL8o=;
 b=iZiNi2KuqqyJ89DOJfIil8LGP3yyj2NKG34GTcfXaQffiyHCbAe7hqWr9Bwi6MzKzc
 iHJhdnhigmgMrfdwn3SWUx60bUSlHn28yjT/eUt42TfZJXhbUuyCGNp1lIfjmw7+bCHG
 XMLo/32TRMgOtDFYAqR7eD/B1i3GCVB8dqsMnPDfcWVRbOytNhVPsdEB8vkSSILbConJ
 7+isJElJnV+OoRf+WRVBSVFpAry6veWLJ478zvzcB+CLJbGxvLwi4T10ckgiwh9lJ1h3
 NcobjVdNKzeMvdAC32xRwkONWWMagIS8BgamDgW9DESfxrDKXTW4W1qBueXyOZx8jTwS
 W3xw==
X-Gm-Message-State: APjAAAX042b+UnQmfz7Gbt4nFjoA+NX7UTggBPKLYmierVWwDLF2XJbe
 Ieo+yXjs5mVsRwLnBF9nRIMVG8QSm4e1XBOif/6/BQ==
X-Google-Smtp-Source: APXvYqz/eQlaMo/cQAAlE711aZK3k2+GPfqRMugcWLDKPzaNYTfk4npvmdEKB5DLzX0nn+FJYXV5VA9eb1nq5t8uzGY=
X-Received: by 2002:a05:6638:692:: with SMTP id
 i18mr20011583jab.108.1569866807369; 
 Mon, 30 Sep 2019 11:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAGMNF6XaNL1HGf7=zKeJrO7CBH_1Y+yhUJi9FQRQ--2V9U+KUA@mail.gmail.com>
 <E6FDE343-5FC6-4493-9D53-BE6317525DB7@fb.com>
In-Reply-To: <E6FDE343-5FC6-4493-9D53-BE6317525DB7@fb.com>
From: Kun Yi <kunyi@google.com>
Date: Mon, 30 Sep 2019 11:06:19 -0700
Message-ID: <CAGMNF6Ushz2WW5+FRWiCBT=Ta5w_ecBAAybZoFbOCZiuVrw67w@mail.gmail.com>
Subject: Re: Accessing kernel panic information without BMC console?
To: Vijay Khemka <vijaykhemka@fb.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks for sharing Vijay. I guess we will look at kdump after netdump/ramoo=
ps.

On Fri, Sep 27, 2019 at 3:29 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>
>
> =EF=BB=BFOn 9/27/19, 3:05 PM, "openbmc on behalf of Kun Yi" <openbmc-boun=
ces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of kunyi@google.com> wr=
ote:
>
>     Hello there,
>
>     Wonder whether anyone has had experience persisting kernel panic
>     information or sending them through network? For a lot of our devices
>     the console is either unconnected or served by obmc-console-client
>     only, which wouldn't be able to capture kernel oops.
>
>     We are starting to look into these tools:
>
>     https://www.kernel.org/doc/html/v5.3/admin-guide/ramoops.html
>     Ramoops says it requires persistent RAM.. Which may make it infeasibl=
e
>     since we don't persist memory (or, we try not to).
>
>     https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__linux.die.net_=
man_8_netdump&d=3DDwIBaQ&c=3D5VD0RTtNlTh3ycd41b3MUw&r=3Dv9MU0Ki9pWnTXCWwjHP=
VgpnCR80vXkkcrIaqU7USl5g&m=3D0H6Yf0igviHCOSHAbOPQxxM-_B0Lh1EyZm4dpdMqe2g&s=
=3DH3n57FRZwV0z_wOHqmaiRa-kQ6h3doWg712SV4ez-GU&e=3D
>     netdump seems promising.
>
>     https://www.kernel.org/doc/html/v5.3/admin-guide/kdump/kdump.html
>     It seems we need more pieces to get kdump working. Have anyone tried
>     kexec/kdump on their platforms?
>
> I have used kdump in past was very happy with it. Yes, it needs lot more
> pieces to make it work.
>
>
>
>     Regards,
>     Kun
>
>


--=20
Regards,
Kun
