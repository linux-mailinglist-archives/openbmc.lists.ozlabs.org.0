Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DEE3DEF2A
	for <lists+openbmc@lfdr.de>; Tue,  3 Aug 2021 15:37:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfGC13fxtz3bVw
	for <lists+openbmc@lfdr.de>; Tue,  3 Aug 2021 23:37:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VeFFiCah;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231;
 helo=mail-lj1-x231.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VeFFiCah; dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfGBk5XMbz2yXW
 for <openbmc@lists.ozlabs.org>; Tue,  3 Aug 2021 23:37:18 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id u13so3253554lje.5
 for <openbmc@lists.ozlabs.org>; Tue, 03 Aug 2021 06:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=II6pG7+j1WTM50CZSTi4HG9hJ/8HurnJnrEpPwWQ1y4=;
 b=VeFFiCah4r+Uhe0PR7etbyG8oRK6cQF6bYDehTj0bkoDcjH3k9hxFGXLTwOMTjlefq
 uS/A2uwgEy7GHZwL5RQm/56TbaHpnE7DV73sJC5YdwU7vdTiiJroNRr5uWCgSOg741CZ
 SZMoaNesftRsJOQhgCUCCQPN92Q32haHhS8vnW0sJ8fQAdlIOH652Kerxj2S4olFVNrV
 zadSwI0/11XjQS4hzHxRTiQeDQWRpsXcf92bo6GxYTw8CY5af1Whlw3OmyaV+VBF56gM
 iUr44bLhgQeYtcJmt7Wz517Nw/QtwZl+656QqRcw8P8bhNXLtspGObo5DRPlgOLp45w5
 Ou6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=II6pG7+j1WTM50CZSTi4HG9hJ/8HurnJnrEpPwWQ1y4=;
 b=LDaUrGRT7/LlFF/QfI9Z8jcoqByDdeFA6tbtNSM7rCDR15S1L4cHdiZ2EZOuBhqV1/
 QtkYWP+FmYvRiAWSh6pi7yl87inT+mTWuO+vWT6R75SAs7lwWn4ARfSH8We0fzeZdWLZ
 ADW9mBkD2KKKSTiv3snpj/nCIbX9T0o82+LmdO+9qGMRgbaDpDiFQ+yxLCnhV2US+RBY
 DQ/R6PiHYr6Er5CW8Nr2d+XEvxh/VBQzDg7O+NgulXopFtDBqeCD7nRU9BCh4I1Eftly
 KQLxD5g1bKntVriujYRqfmQ/flHBkps9wG9Vx/69wMdXae7KcePMklPYGskXx5D3L1vn
 qpMA==
X-Gm-Message-State: AOAM533uY4XsnGlRe1JQffDnkVbptOk/Eta682r0BOlViTNguAYSU33z
 EPdp3oMOUkFtUqF+3Km4i1k=
X-Google-Smtp-Source: ABdhPJxhrDSguAkpC5SlC6KiXqol22QzdcAQ3s5anoqNEm8r7esHrK1oZvCsYU8Qz13e9/3J4nyopg==
X-Received: by 2002:a05:651c:38e:: with SMTP id
 e14mr14463402ljp.453.1627997832404; 
 Tue, 03 Aug 2021 06:37:12 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id x29sm305292ljd.92.2021.08.03.06.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 06:37:11 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 173Db8Q8004404; Tue, 3 Aug 2021 16:37:09 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 173Db7N4004403;
 Tue, 3 Aug 2021 16:37:07 +0300
Date: Tue, 3 Aug 2021 16:37:07 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>
Subject: Re: Installing Windows Server 2019 from a remotely mounted ISO
Message-ID: <20210803133707.GO875@home.paul.comp>
References: <60926e52-9d00-2b20-e8ac-7fd515ddac78@yadro.com>
 <CAH2KKeaBMhU3XDADDE0ieqRRhNBiF57-9rUi+Go-SSJCGG-GBA@mail.gmail.com>
 <3c0b0dc3-a31d-dcfb-608b-53436074397b@linux.intel.com>
 <34751627996896@mail.yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34751627996896@mail.yandex-team.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Alexander Amelkin <a.amelkin@yadro.com>,
 Maciej Lawniczak <maciej.lawniczak@linux.intel.com>,
 Thaj <tajudheenk@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Konstantin,

On Tue, Aug 03, 2021 at 04:26:52PM +0300, Konstantin Klubnichkin wrote:
> It's about Option 2 (preparing image on Linux).
> The sequence in the instruction is:
> 1. Create empty image using dd;
> 2. Create partition table on it with FAT32 partition;
> 3. Format image to FAT32 filesystem;
> 4. Prepare files from Windows DVD;
> 5. Mount image to some directory;
> 6. Copy files to that directory;
> 7. Unmount image.
>  
> I can't get why to create partition table on the image(step 2) if the next step
> (formatting image with mkfs.vfat, step 3) destroys it?

Looks like a typo, s/image/partition/.

That said, booting windows installer shouldn't be anything special
with UEFI, basically you create GPT, EFI System partition on it, put
the windows EFI loader there with the right name plus some files it
needs, and then copy everything else to NTFS partition.

This should explain it with enough details:

https://techbit.ca/2019/02/creating-a-bootable-windows-10-uefi-usb-drive-using-linux/

HTH
-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
