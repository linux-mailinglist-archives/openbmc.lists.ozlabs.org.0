Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EA486A865
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 07:36:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WNaxltWL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tl4Pc6dJ7z3dTw
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 17:36:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WNaxltWL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com; envelope-from=akashgj91@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tl4P51X2Wz30NP
	for <openbmc@lists.ozlabs.org>; Wed, 28 Feb 2024 17:35:51 +1100 (AEDT)
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-7c7ee7fa1d8so51911139f.1
        for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2024 22:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709102146; x=1709706946; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o9RdpWuBoJfJy2mW/v2abLhgTOl2jHVJqaDvDgQjBes=;
        b=WNaxltWLh5V9xBYigovQZIMZqZFGmpGIQxc4aIzv7oe7CwJvNkvECI205ver+0auPG
         2AzWZyAfAhkwuu/1shgjqQl4HIdA5jle+VWgeIvZcto7EBmHKthGch+7jx16h7tZvOsy
         0pvVpCxU3tg0XSKhs2IUqJwUfvMJtWOd8aCttjDQW9Wk2du0CLMlfKnNGpICwNHHP6zW
         fWpLRPAuqb2k8ZewuSCigCIUaDqnvPCG0/BoyMnA3O4GXHjCinjd3cYQElqIMRqfc/5E
         IeSy2YY2qFvhIW7/kmDKAiOUfPdn/Ze3e7qllLlwxZ126LnOiBmg12Bpr3WHUWwi7P7V
         75MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709102146; x=1709706946;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o9RdpWuBoJfJy2mW/v2abLhgTOl2jHVJqaDvDgQjBes=;
        b=AZfRbvHlncA/mnynj1cZ6pqSRjzXuIPiIODcgUEVjq99SDFOcVYB7uCncIFu4A2yR5
         JbA4oTnaU3P72WGpjiZc+7Tsjl+hsvjibed7UzU3quTI2K3niP5kSwSekQ38SJxv2Nlv
         kGWlVz7lw7crSozZBloXB8z0krBuW+5qwmzZmJe8le1mHLev+HmRLQ+5hsYD7zUeYY0u
         0yQuk+71TF99/rHoLFwFGRiZUKxLd4tSLbtanvzlh7C4PiYpPh3HNdMUeX/9w1RB2Iup
         ZIssrsIH+GOHoLOVjFikb16mlLypl1Z84BHnxfByvNIJOQDKSG/l7DZArzN+FsHQ0ZfT
         AN2w==
X-Gm-Message-State: AOJu0Yz+ucQ47ScTzN4SdTT1sA9mW+Khpagaljxl7aM4rcWpW4OZ+Ihh
	TiN21ancD3j19HtxvKmPCMfXGtrcpJUWi5+bhljjN23Eik0kACl1oosUAa78FLzSzFLj9vjQ5Gg
	gE8yFhjdhzzQcrH2lov4uOwhdesTIn3rQ
X-Google-Smtp-Source: AGHT+IHapbQDxNgFar0rCFATdZMVPBoVja4GNMxZU5PEzzBnVC0mew24w9QyJghDTATfhAvbWjssDm0x1Csm4oxyke8=
X-Received: by 2002:a05:6602:4f94:b0:7c3:f162:670f with SMTP id
 gr20-20020a0566024f9400b007c3f162670fmr13366403iob.15.1709102145937; Tue, 27
 Feb 2024 22:35:45 -0800 (PST)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Wed, 28 Feb 2024 12:05:35 +0530
Message-ID: <CAE33tLFTvpHNCuKbHBxvogZ1x1t7JkAHw4MZQsuoYN-=y1tCYA@mail.gmail.com>
Subject: Display Port support for AST 2600.
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000004b246206126b5a4b"
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

--0000000000004b246206126b5a4b
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I want to take display output of host via AST2600 Display Port Interface.

How to enable display port support in BMC firmware for AST2600?


Thanks and Regards,

Akash

--0000000000004b246206126b5a4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>I want to take disp=
lay output of host via AST2600 Display Port Interface.</div><div><br></div>=
<div>How to enable display port support in BMC firmware for AST2600?<br></d=
iv><div><br></div><div><br></div><div>Thanks and Regards,</div><div><br></d=
iv><div>Akash<br></div></div>

--0000000000004b246206126b5a4b--
