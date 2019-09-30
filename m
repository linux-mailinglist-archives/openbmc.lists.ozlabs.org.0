Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D30D3C25EB
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 20:09:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hr5031SJzDqNP
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2019 04:09:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hY67D1Vw"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hr4V1T0MzDqBK
 for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2019 04:08:41 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id a1so40779876ioc.6
 for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2019 11:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nOxxLe2bF9xRu1ptTKnCNB3Bi0oePOhbRRZptMFalXc=;
 b=hY67D1Vwz4pujafUqp1VdU3A0Sey+Cz9R0bq37zWvs1teO6Gg3LyVMKah7A8ETPBEY
 3+4VQLSr045Sa2gmv/sMko9lNHJZfUDe8Tfn/VFSvEOlWbzatOM79oqgDvl/FvpjfQHM
 1gm8yortRYrNT3d6EaL4TNhokBGCt2cmT/5gvGNchXjtldiWyVZOK95GjS2kDkR7GWKi
 wlhN8EAdpcgMdZfp2c8DkAh64UjHjMAjpsUcM8guQ0v/mCEhSFD95kjoWlfodwTGEC3o
 gLsUOfOUuxwqn/xP96Kx5BN1uzK/weZR+X2W9MseKCox9JfoHlZ2bAL/0OFIIIyoCUv3
 /Xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nOxxLe2bF9xRu1ptTKnCNB3Bi0oePOhbRRZptMFalXc=;
 b=JZYkoRjpuR1LbMca0bCzfgGBDP8G4NjNsKZ7Eo+tcGnvYMRHg9JxEOAnEWR6x+n3zL
 QLvd9OuttIB2+h5fYkWdo3PotV2xxlaeKVYJPpDlCsOi4X8ceW+szcB7dCV9knNzMhuh
 vSgFcV0h3lQK2aMIDLSGJh9pxBtC0CZWMxgsRZiZfrp6QQqEd9m5SLJKNm3iPwBpMV5P
 crP7NuUpQKh3hqrYvQMiVzedkVd1voqAIPpUBZavW8FRTVqFSD2aRLyU4v2jEPXZ2LB8
 PjyVxhuBc8d2fF5ECcWt5bST6BnYVEhoavrgKHks07fPJVLyIggZg8wRTwLDOa6RYQbx
 gBjA==
X-Gm-Message-State: APjAAAVmJW+qAfcaUWGrWZvXyqqeVxS/FhgK0RNh51yGcMZCm8RJdsx2
 8EFU87FbK+wYwM9ns01Mw/LHfHdPygV4dht8wI3Z8w==
X-Google-Smtp-Source: APXvYqz2E7I82BP2t8cX7iZu2CfL0r24sImL4KOy+UCYA5GqWMYRfTgIJArZgepmlIxvyzDcFvLeZHDBMZT9fANx9ns=
X-Received: by 2002:a6b:680f:: with SMTP id d15mr22104025ioc.52.1569866919526; 
 Mon, 30 Sep 2019 11:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAGMNF6XaNL1HGf7=zKeJrO7CBH_1Y+yhUJi9FQRQ--2V9U+KUA@mail.gmail.com>
 <E6FDE343-5FC6-4493-9D53-BE6317525DB7@fb.com>
 <000201d5769a$2b91bc30$82b53490$@linux.intel.com>
In-Reply-To: <000201d5769a$2b91bc30$82b53490$@linux.intel.com>
From: Kun Yi <kunyi@google.com>
Date: Mon, 30 Sep 2019 11:08:12 -0700
Message-ID: <CAGMNF6VnX_VyxHQ9FwnV11YqKqmLtb5KSp1YxgDaRy9QNn6bQA@mail.gmail.com>
Subject: Re: Accessing kernel panic information without BMC console?
To: Yong Li <yong.b.li@linux.intel.com>
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Sep 29, 2019 at 12:47 AM Yong Li <yong.b.li@linux.intel.com> wrote:
>
> I am working on this ramoops feature too, and it works on ast2500, just e=
nable some kernel config and modify the dts.

Thanks for sharing, Yong Li. I have yet to look into this option.
Would you be able to share how much RAM you are using and how you
solve the persistent RAM problem?

>
> I will send out a patch about this change later.
>
> Thanks,
> Yong
> -----Original Message-----
> From: openbmc <openbmc-bounces+yong.b.li=3Dlinux.intel.com@lists.ozlabs.o=
rg> On Behalf Of Vijay Khemka
> Sent: Saturday, September 28, 2019 6:28 AM
> To: Kun Yi <kunyi@google.com>; Joel Stanley <joel@jms.id.au>; Andrew Jeff=
ery <andrew@aj.id.au>; OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: Re: Accessing kernel panic information without BMC console?
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
> I have used kdump in past was very happy with it. Yes, it needs lot more =
pieces to make it work.
>
>
>
>     Regards,
>     Kun
>
>
>


--=20
Regards,
Kun
