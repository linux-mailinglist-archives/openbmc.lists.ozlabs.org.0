Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DDE20D07D
	for <lists+openbmc@lfdr.de>; Mon, 29 Jun 2020 19:54:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wZr805p8zDqXR
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 03:54:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335;
 helo=mail-ot1-x335.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DpcA+LWB; dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wZq96dhzzDqWy
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jun 2020 03:53:41 +1000 (AEST)
Received: by mail-ot1-x335.google.com with SMTP id 5so14305808oty.11
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jun 2020 10:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=qtiiE8iQFrvTAARN7IJDP/G68pZXnmmKUWUGhE2EgAQ=;
 b=DpcA+LWBY6BJpIgu94hoco0laJEuuLLxPErInf59WIpT0VcLDNm25RCaceolxXZbJ5
 FgRBVRsFblNq3uPJyh19TvUqbNOJqewZ/ABEz5i7ZszZexUrylXMgU8iBFZ6ViXyNwND
 1dnLPdeMFJWhdM70VNyoyPIOruibDvBMWx1F7V9TVYhqhrm1uE1nm5VSrSsNsIEEWkoF
 p2fBD2iOW/l0OVZ5AnQsuvfzCFWuPnB2cj0z8tCVxoK3uJCj5uqFYVvllFPQ8Q3rDkur
 /HNSGLMCLg/uiXqGBU4Ke2pGnazVUX9m5eX0bui8L28DYO1uhDZMHqsu8kaV1VWRc+jc
 2NaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qtiiE8iQFrvTAARN7IJDP/G68pZXnmmKUWUGhE2EgAQ=;
 b=lbLfk/MIoGiN8ZK63QatB8+MIy4tX8NxT15hINrPHsZI6kpeXX6ATkGQdoZjXIXFY7
 573fP7w+ZCleXjJQV8gfsUF2vwgEDT+ddeeCjSei1obpCcaerwjpIkqOO/VpqoPMUN9g
 H3p39xVuJTzdC1o3xGJR3xrLBScRupDtYwmullRBQQtwSy8tsnMwHZkfrT5S9bRvTDTM
 i4uP8uExwcjz1JkBmaiEoiSd49Qn6/CMs9PGWWkly0peE5ol8eiqwC421nymJPxj30wN
 ZMUGoDKakKEoj/+l9mp0uVUTfU8SuLV55HSMKSY99mNGytlFkQHVSZjdxJYftuic9K6F
 zotw==
X-Gm-Message-State: AOAM533HZRSHsI3vyyrEHWVWjbFlaislcHWo1a5p75BufXC8TdE8WfHj
 eJSSIU8bGr7JXtY+Uvi+XcYQwMz3
X-Google-Smtp-Source: ABdhPJxcv5nEMx6U091fvE/HP4aKYRv3kYwIXRRJYcny4mjGK3WbDbJMyMUpdND7GkxdheMUGAAuaQ==
X-Received: by 2002:a05:6830:19fc:: with SMTP id
 t28mr13299490ott.99.1593453218062; 
 Mon, 29 Jun 2020 10:53:38 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id d26sm149861otl.49.2020.06.29.10.53.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 10:53:37 -0700 (PDT)
Subject: Re: OpenBMC health statistics
To: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <f4e49a09aca2431e921866d1b6cbbe6c@intel.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <0a8a5506-0305-12aa-91c5-6c61d359a808@gmail.com>
Date: Mon, 29 Jun 2020 12:53:36 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <f4e49a09aca2431e921866d1b6cbbe6c@intel.com>
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

On 6/29/20 10:54 AM, Matuszczak, Piotr wrote:
> Hello,
> 
> I would like to upload the OpenBMC health statistics design guide for people that would like to integrate the OpenBMC to their platforms. I would not like to put it into /docs/designs, since this is not exactly design how it will be implemented. This document was meant to guide the OpenBMC users how they can implement BMC health statistics themselves.

I don't see a problem with a guidelines/best practices type guide living 
in docs, but prob not in designs. Maybe in architecture or userguide or 
development? Kind of hard to say without seeing it. You could also 
always add it to the wiki.

Kurt Taylor (krtaylor)

> 
> The question is, where would be the best place to upload such document?
> 
> Piotr Matuszczak
> ---------------------------------------------------------------------
> Intel Technology Poland sp. z o.o.
> ul. Slowackiego 173, 80-298 Gdansk
> KRS 101882
> NIP 957-07-52-316
> 

