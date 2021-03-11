Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A09973377E2
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 16:34:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxCgF4fH6z3cWc
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 02:34:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=n6rsejRi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c30;
 helo=mail-oo1-xc30.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=n6rsejRi; dkim-atps=neutral
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxCg10NQtz3cLb
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 02:34:35 +1100 (AEDT)
Received: by mail-oo1-xc30.google.com with SMTP id
 125-20020a4a1a830000b02901b6a144a417so772107oof.13
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 07:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qk/J+Nh1DlFDA+HKnUH5M3VeeZDGC5UvYbSozWjw0IY=;
 b=n6rsejRiMOiK+mIVJSTPeIMB9GniBmoOBGV+0LYSt2dX7f757CSOq05JImmB2RY2PQ
 ob16OZD95uTCXE/7V/TJEIHyWFPKtPEZe0ou19kO8cDPdeX/07vXXF0g8aAxXp8LQezu
 BamPFy4ga0+EZiIHxwOO4LIbTYepBCdxEJb0yHUG1R5alSyehYZ+l75WL2bDUoMh2eGK
 7/1WiRqhKZ4Z9tYbO9OhDJpefbzMe7UTzXpkeEprT4NoK7lOLyAApIuRZnxuqQNfvOzc
 1VKUknVy9Gj49gfk4JDmVXwUmPaNT8Id9jphjtlrY0BIDuAfRcKior13BWT4AI6eDQFT
 4r1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qk/J+Nh1DlFDA+HKnUH5M3VeeZDGC5UvYbSozWjw0IY=;
 b=hfOo++NJxfmhNW5TMEd0Dg0ulUlKchbz6qKsoiqqHUsEaKLoHXSxx4PuTckDtBCUiU
 UqQIRPIY0B7/pUrd0pa7DeeMnYsFyESpy/XFll9wu4JWsL48w4cbESm+zJaQ9WpE1xSU
 A4Xp5DtGnw2RDFuA/gzPx/n2mOf6hLY5EyfBAvuDTZk6ndNXUDnrDCsXB6TuMM6JmrIJ
 Lpta2GIR0IXPG0KzSPl4/gv+J2Rj6ik5ze7d6iGZAAmh7f4f3r2bInWxsaBDX1Czhv89
 2FAXInPI/yigL1BQpv+h++RkxX9Q/FW8VOyNW8UKI+96sfUZiuZwbrl82TZqRotzVXBK
 0N/w==
X-Gm-Message-State: AOAM532BPdWm2cVTfsH+RJIgqDNe3JmASx4CDtogo9zsq1BpnantiMEc
 X2gr4pAXmMHHp8LofqE0B+gIgehbiSBtTg==
X-Google-Smtp-Source: ABdhPJxASwjue8UiGRu9LC/K749mf0ZIE6zatz4RSb+7F8PJg90wIk8zZ13j3yn/azHQfiPIE2UnmQ==
X-Received: by 2002:a4a:4958:: with SMTP id z85mr7011468ooa.3.1615476872776;
 Thu, 11 Mar 2021 07:34:32 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-104-102.res.spectrum.com.
 [72.182.104.102])
 by smtp.gmail.com with ESMTPSA id z19sm617425oia.25.2021.03.11.07.34.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 07:34:32 -0800 (PST)
Subject: Re: Inspur's CCLA Schedule A update 2021-03-09
To: =?UTF-8?B?R2VvcmdlIExpdSAo5YiY6ZSh5LyfKQ==?= <liuxiwei@inspur.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <28013bbdc3a24c85aaed019f180cc64f@inspur.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <fe874119-3509-5525-5afe-ac28914e0dc5@gmail.com>
Date: Thu, 11 Mar 2021 09:34:21 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <28013bbdc3a24c85aaed019f180cc64f@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: =?UTF-8?B?SGFpY2hlbmcgWmhhbmcgKOW8oOa1t+aIkCkt5rWq5r2u5L+h5oGv?=
 <zhanghch05@inspur.com>,
 =?UTF-8?B?QmVuZGVyIEJhbijnj63ljY7loIIp?= <banht@inspur.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/8/21 7:15 PM, George Liu (刘锡伟) wrote:
> Hi kurt:
> 
>           Attached is the updated Schedule A of CCLA from Inspur.

Your revised CCLA Schedula A has been accepted, thank you for keeping it 
updated!

Kurt Taylor (krtaylor)

> 
> Please help review.
> 
> Thanks
> 
> George Liu
> 
> George Liu *|* 刘锡伟
> 
> 	
> 
> 	
> 
> P.R&D * |* 产品研发部
> 
> 	
> 
> 	
> 
> *T:***15098841013
> 
> 	
> 
> 	
> 
> *E:*liuxiwei@inspur.com <mailto:liuxiwei@inspur.com>
> 
> 	
> 
> 	
> 
> 	
> 
> cid:image003.jpg@01D664C7.5D85FD20
> 
> 	
> 
> cid:image004.jpg@01D664C7.5D85FD20
> 
> 浪潮商用机器有限公司
> 
> Inspur Power Commercial Systems Co., Ltd
> 
> 北京市海淀区上地信息路2号C座5层
> 
> 5F,Tower C,No.2 Xinxi Road.Shangdi,Haidian District,Beijing,P.R.China
> 
> 	
> 
> 浪潮商用机器
> 
> 	
> 
> 浪潮服务器
> 

