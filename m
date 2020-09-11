Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D875265ECF
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 13:34:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BntvY4pP1zDqjM
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 21:34:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=P6xV748T; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bntth4rVVzDqgZ
 for <openbmc@lists.ozlabs.org>; Fri, 11 Sep 2020 21:33:43 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id y1so141710pgk.8
 for <openbmc@lists.ozlabs.org>; Fri, 11 Sep 2020 04:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=KAWYFLS0TscBNvlX1qVUcn0iPsTwBoWoaDuZHJzjym4=;
 b=P6xV748Ti53hPfisF5wnnEU8DD5eoyRAZbxbR/OwZTOyH0W92mLJSRxmAbpPBwz7Aw
 UVg4B1X9irmbB1JpsuQOdy7JvIdlIjruMA+mW50B+GsVuJRDfF/RCCqIgMzoeGU5426p
 rr0fo+0UgqIba1VlepyMFkLRI7SwUbEwkq1hMKjiKa2GyjQdHi+P9/QImYCz1GZQpcKf
 3WtHKcLlX9iZseUB61Tg5Y4nLY5Vg42dNzAjj9XRcAhSE9mODX21LV8ThYlo9K8Hk6xM
 36Ti0dBdEHK3dM7ZCEZFpyMUMviPTJKbJTGyIq1Y0lQ774CaM8VnwqsRdlMOIf1uCYpY
 dwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=KAWYFLS0TscBNvlX1qVUcn0iPsTwBoWoaDuZHJzjym4=;
 b=M9KapZ9bCFMUeL/SnvYp9hAUCmkagLGXOlNW+0k0sgxDwgGFQJ7GdRUJ9fqE+W+1YH
 +cAPEEAddsreHW4ueLsBQek+0k5XGB8Cc9XS/9I0lj3z7b6ieGF6jgkmqM5Cp7tD3edh
 yl7KWUGO1muAVX8OQPz10tU+9MwSlNb/QsF1Lhz4Tz7RYX0uN77ENn1Zue26wdBY8sGv
 g/j889OBYmX49nQpmwjccgoMVyjPFvWBDou+Ta1yRyVzkY/TP8fDRshCtrLiJbxR52H7
 C/iylOWajGUK9hQj+q9ggmB5o2d1QCcDqnEcdeVdSNeevQUMH9emoiYAVAMOc8Z3OuwO
 039w==
X-Gm-Message-State: AOAM530JdjMoTZFRtNkTpaBaXeV7dDNlwO97Q3vBHh3OHmHK/YeCaRh+
 63BUPe97BMII2C4shtp8WfQ68uhwt7Aw+A==
X-Google-Smtp-Source: ABdhPJyh6l5LpWGJrkZE5n3YlZ3CG2hahxKTb6iXR2Kh1GK+fJI0WS3WlTkAGpz6DTRuadJWqm0z3w==
X-Received: by 2002:a17:902:326:: with SMTP id 35mr1618591pld.1.1599824019378; 
 Fri, 11 Sep 2020 04:33:39 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.107.198])
 by smtp.gmail.com with ESMTPSA id y29sm2242628pfq.207.2020.09.11.04.33.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 04:33:39 -0700 (PDT)
To: apparao.puli@linux.intel.com, openbmc <openbmc@lists.ozlabs.org>
From: Sunitha Harish <sunithaharish04@gmail.com>
Subject: bmcweb : https client support
Message-ID: <5c93d1fa-102b-61a1-1dd8-4a371d7c2a2a@gmail.com>
Date: Fri, 11 Sep 2020 17:03:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Hi Apparao,

This is about the https client support at bmcweb. Commit: 
https://gerrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+/31735/. IBM is 
interested in this commit. We have a use-case requiring the redfish 
client to be able to subscribe for event notifications over secure channel.

Can you please share your plan to get this commit to the master? Do you 
have plans to implement the client certificate support as well ?

Thanks & regards,
Sunitha



