Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC94E193C
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 13:46:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ypW13xWgzDqR3
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 22:46:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=acceleronlabs.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=prince@acceleronlabs.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=acceleronlabs.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=acceleronlabs-com.20150623.gappssmtp.com
 header.i=@acceleronlabs-com.20150623.gappssmtp.com header.b="Yk9SIVF6"; 
 dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ypV61g83zDqM0
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 22:45:44 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id p1so12012913pgi.4
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 04:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=acceleronlabs-com.20150623.gappssmtp.com; s=20150623;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=mFQgX5BnaTXjOaGTwcUFe9hUyb0AGSbMBXiafnFO2c4=;
 b=Yk9SIVF69+Vgp4dwgTKbuPLWnhn5EYjGbG3XsdJUhpJUMNBpaWOtq6QM0HeOyzFvVo
 29gbegz9BlIYV9QOAIL9WSxOG+2gTYLG5S0m/XpWcYAOHSNF1MLqW5xKuulPNu1nFHTz
 dGzqEDl2g2ZyAnXM2VUzXPb+Im/7mG0lgHmeTRdn4OypDrDu5iCbQB+HIdPML1yYiiuz
 rT2XQLNp6OdaYCNqYJskkxg0B41UrmqqRKrcoWZlbKuocY5lBCKTogNVMfn+0PRsJhjY
 65G7qj7tkBXGn5k7VkrYdQrv07nUW+bLvYOoz7FJQC41TVZitOYb5Bzhxucnnjm+5kZL
 xAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=mFQgX5BnaTXjOaGTwcUFe9hUyb0AGSbMBXiafnFO2c4=;
 b=c5d9hpuLPjHVEaSESKNnApodhCXmT/SJL3nAT56yKD6qifT1lRLSttYq1c+HdYwGmf
 hFWvq9HOWDb5QK6Hmm3VPvsfnAV9odw9IlnSET9xgz+tHvoOQ/bUR+xgcNi3MkO3IaA0
 +e0DeIDiqU0uHbRowGdj4WJInIoZ6pQ3bH6diBp1+i6MgEUFBg+qNznOQXdzmBjnFlCv
 RSYytLvEV6Sht7oqz8DH6bgnvDMJXsWqEI726PhW/2auWKBwAO2iGWGfTT9KcsQ7mg1u
 xNit3vTrcviZHI3me5+N2M60jHCa2hNjOzncK9kuyIDcOvOr0u0Y7xcKSSUluZwefDho
 8L6g==
X-Gm-Message-State: APjAAAUDyT0o/l50DxR1Vd4Kot9HaczGfrJZUNBL9L9RF8w/9JNJJmMw
 KvXAog2+o7zjThdeKoNTnvBARRH4SI0=
X-Google-Smtp-Source: APXvYqyuOMNBOxTs0OIqZn73PjWSHFn6htqOI4NmwOXEfEHtkifcgyTE3TwUursXnvNxHJYy4gILvg==
X-Received: by 2002:a62:c1c1:: with SMTP id i184mr2496877pfg.65.1571831138971; 
 Wed, 23 Oct 2019 04:45:38 -0700 (PDT)
Received: from [192.168.1.25] ([14.98.27.146])
 by smtp.gmail.com with ESMTPSA id y15sm32722150pfp.111.2019.10.23.04.45.36
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Oct 2019 04:45:37 -0700 (PDT)
To: openbmc@lists.ozlabs.org
From: Prince V S <prince@acceleronlabs.com>
Subject: iKVM support for AST2400
Message-ID: <d7171952-8999-d951-cec0-644f4de524a3@acceleronlabs.com>
Date: Wed, 23 Oct 2019 17:15:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi,

     I have a custom BMC board with AST2400. I am planning port OpenBmc 
2.7(warrior) for the same. The warrior release not mentions that KVM 
support is available. Is this KVM support available for AST2400 Chipset 
also? Can i know which AST2400 platform has support for iKVM in warrior 
release?

Regards,

Prince V S

