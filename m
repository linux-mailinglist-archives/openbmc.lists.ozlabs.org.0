Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F08B53242BD
	for <lists+openbmc@lfdr.de>; Wed, 24 Feb 2021 18:00:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dm2HC6p22z3cYx
	for <lists+openbmc@lfdr.de>; Thu, 25 Feb 2021 04:00:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=YN2i0PcY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32a;
 helo=mail-ot1-x32a.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YN2i0PcY; dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dm2Gy6QxCz30L1
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2021 04:00:24 +1100 (AEDT)
Received: by mail-ot1-x32a.google.com with SMTP id b8so2790040oti.7
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2021 09:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ut7BKLXI7UHIRFPbFoe3gvYwtcR6RE8UNfx/CDgpvyk=;
 b=YN2i0PcYaTTUHxz5BCCbVkHMSjt9xt/ex+nncVXl04e0ks4TVPNzTOFzjsOIcuhZRQ
 ikeYjfgk1Lx2pjVyPpeSRLyzwoHO1HdCkcTiUhMt9i3GiMTmFFvWFNBLa1bbvB2i0E54
 orFaibTblNDajGhTkyV/W5q2X0zlLamI2FOWmx8cti3f/gWmKTd5KG10Liv7VGZ/yQJS
 VwbIGPQ29y4k1JO4OQEMCQUh83hH5B7qPayft0WTUJt7zHuCTeP4ryIn6tlRUAjp0MtB
 muGucskDRE5KYRxg3xEhb6Vf94kZB9NYZ3yH8wIK2PYQo7Qc4LnAPzXSwgOwb2eIo9n8
 Vv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ut7BKLXI7UHIRFPbFoe3gvYwtcR6RE8UNfx/CDgpvyk=;
 b=qPSA7ynuCKgcpJCnpOSqizXZA36i0YTRgCHAd23jIZBHe2HZ6/+lQopHJ/yTP0p7Qq
 IVhr2b/G2L30U42jZiZYorz0XOmK2jJbwwFY0q3rqVJhDzZh82USyktkxJ0iCBJV23Wl
 /f0JEQm8Esa8OJZtbCr/feEyhz99B4Xoc54iw2dTGLAeSQvgyaDGPxwpBrPbdavXQKUl
 6AbLmgV/rkHLb2COZ0QwRAcBpVd3dX69PZPA/8XZO6BX0MsAF0Ol1RxIYCUmRikw4S1A
 lKrLJwflZGxiY1o+AeKLYEvbJgOe2fWRnPwmGciFxHi6MB8Bob1pc7DgcSZ+d/HcET7e
 X7Fg==
X-Gm-Message-State: AOAM530dEa/hASBmxdJSBHS3sQbIouYaW34wWwFxgfPOVp6LX5bGyr08
 qFBll7P9lwj1vsbfli94qRA=
X-Google-Smtp-Source: ABdhPJzuCzBS46Eq088By1O6OrFRHPQfVG0veQ0dagVuXxyuIIvonjHXHU4V+EHXHTKGlRd7EcbtZg==
X-Received: by 2002:a9d:823:: with SMTP id 32mr14200015oty.306.1614186016677; 
 Wed, 24 Feb 2021 09:00:16 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-104-102.res.spectrum.com.
 [72.182.104.102])
 by smtp.gmail.com with ESMTPSA id t2sm475810otj.47.2021.02.24.09.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 09:00:15 -0800 (PST)
Subject: Re: OpenBMC
To: Daniel Brennan <danielbr@synnex.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <BN6PR04MB02751CA806D404FA7CA19855B9819@BN6PR04MB0275.namprd04.prod.outlook.com>
 <BN8PR04MB6164B5E8966F9438F0180DB8B9809@BN8PR04MB6164.namprd04.prod.outlook.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <17a3b0e5-4613-8388-ad69-427c41439343@gmail.com>
Date: Wed, 24 Feb 2021 11:00:14 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <BN8PR04MB6164B5E8966F9438F0180DB8B9809@BN8PR04MB6164.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: Janny Au <jannya@hyvedesignsolutions.com>,
 Eric Kuo <erickuo@hyvedesignsolutions.com>, Legal <Legal@synnex.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/23/21 7:55 AM, Daniel Brennan wrote:
> Attached please find the signed corporate CLA for Hyve Design Solutions 
> with the completed Schedule A.

Your CCLA has been accepted. Welcome Hyve Design Solutions!

Kurt Taylor (krtaylor)

> Best regards,
> 
> <https://nam05.safelinks.protection.outlook.com/?url=https%3A%2F%2Fhyvesolutions.com%2F&data=02%7C01%7Cdanielbr%40synnex.com%7C9027edb06a2846bd6ac708d850d7d026%7C972a0e27c3554fd792259266c8f332ac%7C0%7C0%7C637348235423425833&sdata=y5vwFB0yKhuH92k0A98BiAuuub2WOou3C%2Blcg9YvCQk%3D&reserved=0>
> 
> 	
> 
> *Daniel T. Brennan*
> 
> Vice President & Senior Counsel
> 
> Direct:  864-349-4801, ext. 49-4801
> 
> Mobile: 864-376-4111
> 
> Fax: 510-360-6613
> 
> 39 Pelham Ridge Drive, Greenville, SC 29615
> 
> *From:* Daniel Brennan
> *Sent:* Monday, February 22, 2021 1:30 PM
> *To:* openbmc@lists.ozlabs.org
> *Cc:* Janny Au <jannya@hyvedesignsolutions.com>; Eric Kuo 
> <erickuo@hyvedesignsolutions.com>; Legal <Legal@synnex.com>
> *Subject:* OpenBMC
> 
> Attached please find the signed corporate CLA for Hyve Design Solutions.
> 
> Best regards,
> 
> <https://nam05.safelinks.protection.outlook.com/?url=https%3A%2F%2Fhyvesolutions.com%2F&data=02%7C01%7Cdanielbr%40synnex.com%7C9027edb06a2846bd6ac708d850d7d026%7C972a0e27c3554fd792259266c8f332ac%7C0%7C0%7C637348235423425833&sdata=y5vwFB0yKhuH92k0A98BiAuuub2WOou3C%2Blcg9YvCQk%3D&reserved=0>
> 
> 	
> 
> *Daniel T. Brennan*
> 
> Vice President & Senior Counsel
> 
> Direct:  864-349-4801, ext. 49-4801
> 
> Mobile: 864-376-4111
> 
> Fax: 510-360-6613
> 
> 39 Pelham Ridge Drive, Greenville, SC 29615
> 
> [External E-mail] CAUTION: This email originated from outside the 
> organization. Do not click links or open attachments unless you 
> recognize the sender and know the content is safe.

