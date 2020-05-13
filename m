Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEF01D03F5
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 02:51:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MGMj0ZjgzDqjx
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 10:51:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::143;
 helo=mail-il1-x143.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=dAoPVdKT; dkim-atps=neutral
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MGLz0XtfzDqSv
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 10:51:04 +1000 (AEST)
Received: by mail-il1-x143.google.com with SMTP id j2so3531616ilr.5
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 17:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3024cFAfc2hy4NzyqWA/e+iK00Q0pJLuA3PFhmDnSIY=;
 b=dAoPVdKTYaIB4hKnWx+hPfyP8BT3x7uf8WecW1f370TPgkNw7URa3qV5kO5b/n+sfU
 X8XAuHSYtC9MRQV4ndDcM8JfIH76m6coS1Gvj1meARyLa7zhm/X+VWMwjuJzVAuqsA9O
 e+W854Re7u7GIdgO8tVMj+KHZA/KDSFH+IUfeO3lEhC7eQ+KF2J2GPjPPc2z44UFUKwb
 eUruHhjrGKMSzWUHiWyha5j1cW7BTK3C/JRBl4lN87U+Fg7hxmctDmzl5grC+kesNLl8
 CRfFvIArnbRQWXUKPYbJhZgfxQpePmd+18s9dC78Ej0+k0iQ+P5m5/tekoZpcJtrzBkY
 V22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3024cFAfc2hy4NzyqWA/e+iK00Q0pJLuA3PFhmDnSIY=;
 b=piSNiCkWroXk1+p0UJ5pdLfBRMIbmx74VvY+grz8ILp6t19lLfktPNQ40D+rztjgo+
 QpcJn9XkqapZ08ZITmvBRtWZZL7cD688K1ItN9gjoMvrjnmO/YFakWm32Rnvscyrd+hU
 YV9MD3YZE3fdC98XF7e0bqAmlXNrzSe/UQ0mA+kHXjUqssgOf0GbojnH8Bob9uJToyEE
 0Jj5AY2OuiXBbu0rI2H3D4soqiSjRjLDDMlronhSNfparDoKXpqRSXkkceK9jDmJwQu2
 Cr1BHm5AnG5V9NyYK+svm3qtF4u4G4RHZ+df2If2HyAAxPu0+GRE42+WvyC82xWoEhCR
 fh4Q==
X-Gm-Message-State: AGi0PuY+YjS2dWuUtxQObR3pf2EoDlhGjfM1XIT41FlIMo3q9lT4DBr3
 73mnQl7QJ/cHaY/SeBeRjiK6eyH4BS/Yw2vFQcbqmg==
X-Google-Smtp-Source: APiQypKJ0SCOGEXlkNj+GGNapdZzf7IBXFWZr7+HATEI9gzj9J2Cj9zaiii72uXxswYSd2c13QJgSDNTZtNgp/JOBNc=
X-Received: by 2002:a92:8747:: with SMTP id d7mr21288669ilm.235.1589331060462; 
 Tue, 12 May 2020 17:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <d5f9ec4e5c554c2b9588cb7ba2bec581@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <d5f9ec4e5c554c2b9588cb7ba2bec581@SCL-EXCHMB-13.phoenix.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Tue, 12 May 2020 17:50:20 -0700
Message-ID: <CADKL2t7QZMt21je4RmRDXQtvgmvMP4_oJZDyCoSorjWi-n5AOg@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash interfaces
To: Patrick Voelker <Patrick_Voelker@phoenix.com>
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
Cc: Patrick Venture <venture@google.com>,
 "OpenBMC \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 12 May 2020 at 17:18, Patrick Voelker
<Patrick_Voelker@phoenix.com> wrote:
>
> I got a "ipmibt" interface transfer complete and want to move on to one o=
f the faster interfaces to speed up debug since it takes so long to transfe=
r the FW image.
>
>
>
> For the "ipmilpc" and "ipmipci" interfaces, do those options require ASPE=
ED_LPC_CTRL and ASPEED_P2A_CTRL respectively in the BMC's kernel config?  T=
hose two configs happen to be disabled in the BMC I'm building and I've bee=
n searching for examples on how to configure the memory regions correctly b=
oth on the BMC and the host side and am not entirely sure what I'm looking =
for.
>
>

Yes, you'll need the LPC or P2A drivers on the BMC to make these
bridges work. You'll also need some extra configuration in the BIOS
that reserves a memory region in order to use the LPC bridge.

I believe Quanta's Q71L machine uses P2A/ipmipci for updates, so take
a look at the device tree for an example
(arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts). I've CC'd Patrick
Venture, since he worked on this machine and phosphor-ipmi-flash.
Hopefully he can fill in details if I'm missing them.
