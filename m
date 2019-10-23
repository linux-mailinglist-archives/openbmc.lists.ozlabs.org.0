Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A408E1D5B
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 15:52:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ysJR3dTYzDqJc
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 00:52:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uTy61VuT"; 
 dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ysHZ6dhkzDqRH
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 00:51:54 +1100 (AEDT)
Received: by mail-oi1-x230.google.com with SMTP id a15so17446866oic.0
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 06:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yeF3yWbG0FB+QE8K7x1KX54xfSlFyrPSefpN8OU19fo=;
 b=uTy61VuTcerBdduYMU0qDZDwyybYIPoBsV4QL8WY63HjHo0dISrkB5NBAlHFEia9cO
 FiPO9h0j9hADRUxugXmlo5Fvh5JJoLVZXM8zzpmN51IGH2m5Ta3iH/b1IpMk5tgam0GV
 YEDUVMkVk/D75yAZ40DuhFXzhU84jB50S75wEsOc3CRaCR6p+rn63waDVn4F69MxOqUK
 KYX9XU5sfhJP3vopiD9ymXpWRPTICyxe12Yek8ZrV+lLo/NqojtS4UjXFpdP8hizLsne
 W3ON9BMl68uwvmjsem7F4KXSBeRV22Gxp/GYd9L2VxTNojiqt6llxKSPk+zTBh1Vo82y
 APig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yeF3yWbG0FB+QE8K7x1KX54xfSlFyrPSefpN8OU19fo=;
 b=Xpr2biHxwgzF0kCdULd9oH3yoZgc1GQK4bz/SVwbaFGuq+miN7pwvjIq+RpIDL01qa
 HFOS/xTjAFXMy/4L1vSRgPREvSQIKrd0WPwf00E/o6shEWpPOTQGiYam2Ybyps4vQC/p
 Dr1/xYC+AhFWFW+2izv1zPJ/6hzRrDCYtYBwXQ7U11iSlz3Ew2x9oS6jaWEwMkwsKBxB
 NWb6qvHKbAFuZO+dArlIokgN5MtggitfGNjan+bENcSMMajpwwXnghf4VLAZBroUhgcb
 TnO155anaQkxE4IYqd91g6QMcgUa6yQ3ExhH7qyZ9QLdXStn3t5GaA1X4x7v+aeVxlh5
 tSrA==
X-Gm-Message-State: APjAAAWeQClNHmz7DDh7l/NTpYuzJTpgZBubO6UdSMZT4kt7O/s5D3vI
 lvA6k8E7ntU9+Hz2YIxEwiddLW8W
X-Google-Smtp-Source: APXvYqwIry/6oyMXg9LnH3t7fWuBFCxumdiWtMOs22aBxyUQy9ooMP7KY9cL/PmZdPRnNaU7p99MxA==
X-Received: by 2002:aca:b983:: with SMTP id j125mr36280oif.60.1571838707753;
 Wed, 23 Oct 2019 06:51:47 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id 17sm5571537oiz.3.2019.10.23.06.51.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Oct 2019 06:51:43 -0700 (PDT)
Subject: Re: Improving the docs/ repo
To: Gunnar Mills <gmills@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <2c77cbfb-9df5-278c-8f76-06193e125514@linux.vnet.ibm.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <3a4d96b9-8810-e57b-690d-5fd791bc57c0@gmail.com>
Date: Wed, 23 Oct 2019 08:51:42 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2c77cbfb-9df5-278c-8f76-06193e125514@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/22/19 11:38 AM, Gunnar Mills wrote:
> Looking to improve the docs/ repository.
> Is anyone interested in getting involved in improving the document 
> repository? Looking for either ideas or contributions.
> 
> Some ideas:
> Better document the process for submitting documents which should 
> improve the quality of documentation being submitted.
> 
> Design template improvement, spell out any additional expectations that 
> come in review. E.g. All fields must be filled out, involve the 
> community before submitting a template, avoid internal acronyms, expand 
> on when the template is needed.

Love this - I'll help as I can. I'd like to see TSC and maintainer 
agreement of more strict guidelines.

> Improve the glossary

We can add the BMC terms that I started, now where did I put that...

Kurt Taylor (krtaylor)

> 
> Some automation, check for dead links, markdown formatted is available 
> for the reviewer.
> 
> Improve the layout of the docs/ repo.
> 
> Improve the README, have a well laid out starting point.



