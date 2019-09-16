Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FE0B3A5E
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 14:34:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46X5K70qNlzF4CJ
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 22:34:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::242; helo=mail-oi1-x242.google.com;
 envelope-from=bluecmd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="po6x93nB"; 
 dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46X5J80PDRzDrFb
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 22:33:26 +1000 (AEST)
Received: by mail-oi1-x242.google.com with SMTP id 12so8145215oiq.1
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 05:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F4LRn9fkHPCJfESTtOvZmjDJA2kSbCn0pRGfNaa0TRU=;
 b=po6x93nB3sHmZa0sildt+K+C+4vMeff1WhHRyOMlmjMZt8SU0dHOtGAXHPPhnmgwSI
 OUATXGM6b46sz9VMsjPDIpBDCy0ivBpkthAYbRUW4mW0ypq7HVI6cwYl8vBE2eV/hDzb
 CfQKr0qT9cQVRZ5dT1+YnLqw6hwT40NszqatDVOWTXFIsWMvuIttVEq9jwfK+ADQPpAf
 iVaXfYEYoSXSdJuPfys2S55YtMNgOklDOtRCb2+E5+Ak8vcwHDbqWGjwxhGr0dvDhG0h
 q70ZYv83hkyHlebPQ+SJs7MRlmqobJIgMUTgSi31J7ya23gP9hB19rYwNkEWC9auTSuD
 K24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F4LRn9fkHPCJfESTtOvZmjDJA2kSbCn0pRGfNaa0TRU=;
 b=IzRcxD/9l85ZXwainxG8gdyZtZTL13CGQxCDOwRTqfKDMj7oKoYLh7sSW7PifIDaH3
 n7M51wnRGoTArKH9R4Rzk6b3wDaFxTAy5x7WJ3yb8s1LuzzTbXXQujpQHC2OIKFJaCGV
 EO/CooD8IdaWp3X3ZlvvDoInnP/n0WvDhSPXZa+CYEbr5pIr5IITu8gjsVqPXr7OGZah
 K6ySEg76kGRK57YnSa2fmR6zklsS7kIeqJ2VJgo7D7oeBYpaF9LBeVAgBitP5Aa2FJIg
 fXHHCm0PuZDXLBWjEGsmG0RTfLNThHrNcTPyYrPPFU04kLZ4Cf8AfwQX6r+KdCoNea2w
 8pLQ==
X-Gm-Message-State: APjAAAUy9Q0ZOl5vftGyiMd/HuagSbG38r6b8R1I6DZR+CUmklS5vOIl
 N2FiDpVnru3y1crxOsdQ7cu7d3KejArm9VhZVQkjlQ==
X-Google-Smtp-Source: APXvYqwywuXhsu8UgCrzq058Aw9Iij91sBAOj3MwurXJi/VwpnkP4cuOWybdgKYQnnHi8DJDRa1P426y3QLVqgDmCuU=
X-Received: by 2002:aca:b541:: with SMTP id e62mr12903096oif.90.1568637201098; 
 Mon, 16 Sep 2019 05:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190912190451.2362220-1-vijaykhemka@fb.com>
 <eb370d3280327b512828adc62b64656e65b22745.camel@mendozajonas.com>
In-Reply-To: <eb370d3280327b512828adc62b64656e65b22745.camel@mendozajonas.com>
From: Christian Svensson <bluecmd@google.com>
Date: Mon, 16 Sep 2019 14:33:09 +0200
Message-ID: <CAEfeXva6c-CkUziTiC=uzoqTn9Ycxh=1mW8bYZuFfP4no_kReQ@mail.gmail.com>
Subject: Re: [PATCH] net/ncsi: Disable global multicast filter
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Content-Type: multipart/alternative; boundary="00000000000027ca280592aacf95"
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
Cc: linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000027ca280592aacf95
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 16, 2019 at 4:39 AM Samuel Mendoza-Jonas <sam@mendozajonas.com>
wrote:
>
> I'll have a look at the multicast issues, CC'ing in Chris too who IIRC
> was looking at similar issues for u-bmc in case he got further.

Thanks. I think this is very similar to the patch that u-bmc has, but this
one is an actual nice-looking patch :-). The u-bmc one is just a bunch of
#if 0's around multicast filtering.

What I'm worried about is that we forget why IPv6 works by disabling
multicast filtering, I don't see any elaborate mention of this in the code.
The long-term fix is to make sure the GMF is programmed with the correct
multicast groups to make IPv6 happy, and we shouldn't lose track of that I
feel. However, as an intermediate fix I welcome this patch whole-heartedly.

I will see if I can dig up an eval board to try it on and add a Tested-By
in that case.

Thanks,

--00000000000027ca280592aacf95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Mon, Sep 16, 2019 at 4:39 AM Samuel Mendoza-Jonas &lt;<=
a href=3D"mailto:sam@mendozajonas.com">sam@mendozajonas.com</a>&gt; wrote:<=
br>&gt;<br>&gt; I&#39;ll have a look at the multicast issues, CC&#39;ing in=
 Chris too who IIRC<br>&gt; was looking at similar issues for u-bmc in case=
 he got further.<br><br>Thanks. I think this is very similar to the patch t=
hat u-bmc has, but this one is an actual nice-looking patch :-). The u-bmc =
one is just a bunch of #if 0&#39;s around multicast filtering.<br><br>What =
I&#39;m worried about is that we forget why IPv6 works by disabling multica=
st filtering, I don&#39;t see any elaborate mention of this in the code. Th=
e long-term fix is to make sure the GMF is programmed with the correct mult=
icast groups to make IPv6 happy, and we shouldn&#39;t lose track of that I =
feel. However, as an intermediate=C2=A0fix I welcome this patch whole-heart=
edly.<div><br></div><div>I will see if I can dig up an eval board to try it=
 on and add a Tested-By in that case.</div><div><br></div><div>Thanks,</div=
></div>

--00000000000027ca280592aacf95--
