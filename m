Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42763139DAF
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 00:55:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xVp85TrPzDqPl
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 10:55:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j5RCUXIk; dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xVnL1pbbzDqJY
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 10:54:43 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id 18so10098414oin.9
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2020 15:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mmrxdrxiETjTLMsgtBl+LuvXtxYGiCxHr4Ayrvw0bBw=;
 b=j5RCUXIkhcVjCfUTrIlApTlTfQjGon4OgIKGe4+IEJtFxhQLEZj5SV7/2yUmRY+B1N
 KmiDZ9s/wUWJ2wWDya9B80FhrkVBIEA/yJpo2lK+hdpSnWF1LyOMlzvGfmc+3BlSCdNE
 jTlJlS2v7ySL5Kb9h4Uu905E4O9135mZse0juiQ5MfvcCH+zGBY3D9pyjjy+R5ToTymb
 luMhdfAVcuEZwpwSfRUqv/nirIoXvegJJZqqpNW0AsWYLPldiZQEDpZlAt4bUEDLNs4j
 QzcnJ1vD5mowtXHz+HaIsTQ/RSvtpYXnkuMDoeSUQuF05tnBchoVAB0QdB2AhAS18cNs
 RRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mmrxdrxiETjTLMsgtBl+LuvXtxYGiCxHr4Ayrvw0bBw=;
 b=ZQjnDCehcBBIxfk942XKEcJWj47D1bsnwx+6yTsTgeGHV3fWmxqhOtvFx2fOf/rKqU
 0N0+Qq+Qe6wgTNy2+dI1y1toYuYSOPBCVeNV/v9zHcV1hD+/gkReZQhak2FNCWV+61Ze
 qWDn/JIF4o7w9djOtgpMErlSHTVrfRiFDL1MJm8u5PjuAPMrKhb7aBM2tstCeQmsLAKW
 q2eqxYppDDu6A6zG6Pi4NVPfgkcW1Y7IYw53ZeI/R3tlcJru2Skrjl6FIOUEV0UV6UKp
 rt4aeHKA4ckpgf4l0qsmf7yH0jsN2iVlZWiF8XXhqBXVgJvBQd2/5f9jx3cTUlh2b4BU
 Dnkw==
X-Gm-Message-State: APjAAAUvCkf+La3jzfTSfHYHSK46Uwr1uu78jAOnqkuP/RVyfH/QWJ2d
 HK54YTgvgO02MW20mfTwN7E=
X-Google-Smtp-Source: APXvYqw6fjd5jnV89RLWYw17F7dM8RrlmMp+TDnXc0I31MExO29uW4pUWuoSMpRKX5AfbXC+3giUzg==
X-Received: by 2002:aca:4a87:: with SMTP id
 x129mr14188502oia.165.1578959681605; 
 Mon, 13 Jan 2020 15:54:41 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id 17sm4710686oty.48.2020.01.13.15.54.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jan 2020 15:54:41 -0800 (PST)
Subject: Re: Add member into Lenovo designated employees list
To: Benjamin Fair <benjaminfair@google.com>
References: <0700dec94d76447faae7ab98c0c04516@lenovo.com>
 <CADKL2t5wk+2Yd39=XLih7vFsACrgmsJp96b-su_S5zLis6EgDg@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <16a6405b-bbcb-e85d-47bb-280d51fe6785@gmail.com>
Date: Mon, 13 Jan 2020 17:54:40 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CADKL2t5wk+2Yd39=XLih7vFsACrgmsJp96b-su_S5zLis6EgDg@mail.gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Duke KH Du <dukh@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 1/10/20 11:22 AM, Benjamin Fair wrote:
> Hi Kurt,
> 
> Could you take a look at the CCLA update from Lenovo when you get a chance?

Yes, I have already communicated with them (Dec 13th) about what I am 
needing.

Kurt Taylor (krtaylor)

> 
> Thanks,
> Benjamin
> 
> 
> On Fri, 6 Dec 2019 at 12:45, Duke KH Du <dukh@lenovo.com 
> <mailto:dukh@lenovo.com>> wrote:
> 
>     Hi Master,____
> 
>     __ __
> 
>     I would like to add more members of Lenovo in the designated
>     employee list as below in Red.____
> 
>     Could you help on that?____
> 
>     __ __
> 
>     Schedule A____
> 
>     Initial list of designated employees. NB: authorization is not tied
>     to particular Contributions.____
> 
>     Please indicate “CLA Manager”next to the name of any employees
>     listed below that are____
> 
>     authorized to add or remove designated employees from this list in
>     the future.____
> 
>     __ __
> 
>     CLA Manager:____
> 
>     Duke Du dukh@lenovo.com <mailto:dukh@lenovo.com>____
> 
>     __ __
> 
>     Other designated employees:____
> 
>     Andrew Peng pengms1@lenovo.com <mailto:pengms1@lenovo.com>____
> 
>     Yonghui Liu liuyh21@lenovo.com <mailto:liuyh21@lenovo.com>____
> 
>     Lisa Liu liuyj19@lenovo.com <mailto:liuyj19@lenovo.com>____
> 
>     __ __
> 
>     Payne Yang pyang4@lenovo.com <mailto:pyang4@lenovo.com>____
> 
>     Harry Sung hsung1@lenovo.com <mailto:hsung1@lenovo.com>____
> 
>     Ivan Li rli11@lenovo.com <mailto:rli11@lenovo.com>____
> 
>     Derek Lin dlin23@lenovo.com <mailto:dlin23@lenovo.com>____
> 
>     __ __
> 
>     Thanks.____
> 
>     *From:* Duke KH Du
>     *Sent:* Monday, April 8, 2019 8:44 PM
>     *To:* openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
>     *Subject:* Add member into Lenovo designated employees list____
> 
>     __ __
> 
>     Hi master,____
> 
>     __ __
> 
>     I would like to add our new member in Lenovo designated employees
>     list as below in RED color.____
> 
>     __ __
> 
>     Could you help on it?____
> 
>     Thanks.____
> 
>     __ __
> 
>     Schedule A____
> 
>     Initial list of designated employees. NB: authorization is not tied
>     to particular Contributions.____
> 
>     Please indicate “CLA Manager”next to the name of any employees
>     listed below that are____
> 
>     authorized to add or remove designated employees from this list in
>     the future.____
> 
>     __ __
> 
>     CLA Manager:____
> 
>     Duke Du dukh@lenovo.com <mailto:dukh@lenovo.com>____
> 
>     __ __
> 
>     Other designated employees:____
> 
>     Andrew Peng pengms1@lenovo.com <mailto:pengms1@lenovo.com>____
> 
>     __ __
> 
>     Yonghui Liu liuyh21@lenovo.com <mailto:liuyh21@lenovo.com>____
> 
>     __ __
> 
>     Lisa Liu liuyj19@lenovo.com <mailto:liuyj19@lenovo.com>____
> 
>     __ __
> 

