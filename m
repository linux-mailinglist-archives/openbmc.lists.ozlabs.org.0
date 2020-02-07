Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 656D0155D3A
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2020 18:58:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DjjB5TfNzDqgd
	for <lists+openbmc@lfdr.de>; Sat,  8 Feb 2020 04:58:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235;
 helo=mail-oi1-x235.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XbgtFpJ8; dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Djhc3kmtzDqbm
 for <openbmc@lists.ozlabs.org>; Sat,  8 Feb 2020 04:58:21 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id l9so2819332oii.5
 for <openbmc@lists.ozlabs.org>; Fri, 07 Feb 2020 09:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y/Pu4/5TNWEbBxNNIEtW/omWLhVG/eT0FRZx24Pi7Ko=;
 b=XbgtFpJ8XIvKa3dETv1siSny+bWAUPhJHJlpJC74LARBoWXMrFK1pSqb52OUHuJDDE
 QBCI6FXAQd4sR6jedvNWurQdX8MMTooC8q0qYXqEqfXKvFXuKT7d//QvmSJH5KLN07nW
 gqbym2b6itdyOp0v8N7wMDTWnj09RzypHx4D7S8rc9TOBOGnvbK6fe9NLX05bJij/pTe
 LW3U+4a1nGZj7ZNPpzZIy33NV/Jf2C/u6bGo8Emy9jMnOghwJp4mwpSYBehjXcFNhkyo
 WMvo5Ey3mJd3XpCWDJgdnt1CDoRfoWxCJ1fwumXdq/0NAuaJfYRSyY3Z0sPQ0g6EGEPT
 FBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y/Pu4/5TNWEbBxNNIEtW/omWLhVG/eT0FRZx24Pi7Ko=;
 b=T1B84g1XhwS2Du+RuVOKykY68DNjwAaOd/8x3kwSYXr5uFtUHRHvX0Ge5q1Z7+UI3o
 cc87KNyxKfFNCS0KoysscHoKQ4ChvWakY5XPO4gVmMdiZRnQGGioJSi7g75E8w0EggPf
 VBK28o38qk9ZJHjBzG5sH3kP/LR1vexYkRZjbg0xDlA8nfxepoW+NZXWj/4DmrGcu7dh
 gCuc+W/DgyFdm+VjRM5eCbo5bOXhm6MMSDTEpoISH3d+5daXmM+xdiJkSJPTDMciEBd2
 ga2aAFN/8CaG/t3ZuVAGXKSRxwNyBthJJ26M4NjIaIlz7vJ1mbrHVSL6LRvG/dau/DCz
 FVnQ==
X-Gm-Message-State: APjAAAWDViMvv2+5Rruf4r9eWyh72mpEP6fnF5WV2QkeEAKDjmIb3IDz
 MpRfcE9OqyQRqkOGo/wFqoo8ZbuI
X-Google-Smtp-Source: APXvYqxsprhVEdEkYW641++g4vI+IZmMbrKFtGaCukYSzoKLgTWfwvWgLCpVZRbUdxPOX0koJ9lxiw==
X-Received: by 2002:aca:560b:: with SMTP id k11mr2855551oib.53.1581098297925; 
 Fri, 07 Feb 2020 09:58:17 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id e16sm1279421otp.72.2020.02.07.09.58.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Feb 2020 09:58:17 -0800 (PST)
Subject: Re: Community support - where do want to be in a year?
To: Patrick Williams <patrick@stwcx.xyz>
References: <CAG5OiwhNq55Om4=NU8F7SSebDqMQpKhHuhAC-aFz=QKBLM6Wig@mail.gmail.com>
 <20200207163045.GA38734@patrickw3-mbp.dhcp.thefacebook.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <c35f31e6-29fc-223b-08f1-7357457f813e@gmail.com>
Date: Fri, 7 Feb 2020 11:58:16 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200207163045.GA38734@patrickw3-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/7/20 10:30 AM, Patrick Williams wrote:
> On Wed, Feb 05, 2020 at 06:02:01PM -0600, Kurt Taylor wrote:
> 
> One interesting thing the #yocto channel has on IRC is a bot that
> posts links whenever someone opens a Stack Overflow with a 'yocto'
> tag.  I think we need a better mechanism to help with "drive by"
> questions.

Yes! maybe a variant of the meetbot functionality to monitor SO - may 
require channel logging, we'd need everyone to be comfortable with that.

Thanks, I'll add that to the list...

https://docs.google.com/document/d/1QCFRGCRofcR3K8clSLtJHw10-Cu9zkp0dvwXPWzQSCc/edit?usp=sharing

Kurt Taylor (krtaylor)


> This was pointedly said in the IRC and I certainly agree with it:
> 
>      ------: I realize ------ is asking a lot of basic questions that most
>      of us would normally answer by reading the code and experimenting.
>      They are highlighting major gaps in documentation though
> 
> We often have introductory questions on IRC and mailing list that go
> unanswered.  So, having a Stack Override bot wouldn't do anything if
> people don't take turns answering.
> 

