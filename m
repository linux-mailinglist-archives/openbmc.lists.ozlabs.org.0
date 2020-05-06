Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 087AB1C736B
	for <lists+openbmc@lfdr.de>; Wed,  6 May 2020 16:55:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HKQn6D4vzDqSq
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 00:55:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rvGwONeY; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HKPS5VctzDqg6
 for <openbmc@lists.ozlabs.org>; Thu,  7 May 2020 00:54:36 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id o7so1991876oif.2
 for <openbmc@lists.ozlabs.org>; Wed, 06 May 2020 07:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=uYjG4cjWh1ved3drKChirdlU5FJZ8mmH+8zLA1asmbc=;
 b=rvGwONeYs7z0VvzTLYDbd8lq50MFV0i3re5xZZykxiATuczxdJ+/7yhgko3LQuwYKA
 Hsu4HIkLm/FSg3GWTbWvPZh4onL04QPjZJkFEIJ9t6F69lrl0DZ2OSBmU/gJogUNdTCO
 4MXyjz9jg2k7J4NIf5qWSMVANrSSP/fxi3Dm916564zq3dOA1yZU2OsLcijn1V8wW9/r
 B2WDMsWHp4NRL7VsnsbLKEQtODLHhZ+OsmBLVLPvbrsL3acVft4LWfMRgcX2T6P4rfJN
 ufh6G9n+B1S6trNve6yRM8wTnx/o2ktbvPyTm7VL3euV6R/96QKE2esgC3qvcUSURgCL
 TahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uYjG4cjWh1ved3drKChirdlU5FJZ8mmH+8zLA1asmbc=;
 b=Tkx9etlwwvn3Fu1K6UeEOEPvFW/MWi25z/3kYuN+rTSFC9VeqNhY7O868q+Ac24oEx
 21KlU7iOJm4ltwTrAXT94IiDFOm/FPkrxRqqT66IUVbcngk7Aka/fjchvHuFePqmLOLw
 zeAblCRBssuKlr/w4f28FkT6it8H/sVwC66HhWpTbuPwm7VHmiFK5JYge3N4djSEPkCx
 FBs+pxxgrZ57ErSB7cKJc8MY1sxTHLAKTCf4RhAys79CZ3nqtKOuwS4uvp4V/J6Fyh2b
 RhFhIqM8r2c1uo/ViFmQi9JsthOEaFjnHUtbJ0Up/BAmUJi+MlCF3b0Uw8NfpKizLTxc
 R+6w==
X-Gm-Message-State: AGi0Pua99Jcf3C16Izd6bWtiBk12A2BxvIHwOIMyYSISkKAhADHyNY3j
 pyaOE/g/JEXjmiqV2wZBqCxvuPqHdD8=
X-Google-Smtp-Source: APiQypIr69pQWs0eFC3RfWehajjuFg2dXQfGnwGJVl8CuUaZmsKmfWuJS69WU+tIoPd6ajOy5D7VQQ==
X-Received: by 2002:a54:4117:: with SMTP id l23mr639696oic.46.1588776871728;
 Wed, 06 May 2020 07:54:31 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id y131sm552817oie.39.2020.05.06.07.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2020 07:54:31 -0700 (PDT)
Subject: Re: Signed CCLA from Bytedance
To: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>, openbmc@lists.ozlabs.org
References: <CAGm54UFityc=hV5aZuwdhjNE2qHmwiUfpO5Wjuw6XhvTpRRDnQ@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <5c2dc0b2-1d6a-d75a-9a8c-32e9b60b8d0e@gmail.com>
Date: Wed, 6 May 2020 09:54:30 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAGm54UFityc=hV5aZuwdhjNE2qHmwiUfpO5Wjuw6XhvTpRRDnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 5/6/20 6:59 AM, 郁雷 wrote:
> Hi Sir,
> 
> Here is the signed CCLA from Bytedance.
> Please kindly help to review and approve it.
> 

Welcome! Thanks for signing. Your CCLA has been accepted.

Kurt Taylor (krtaylor)

