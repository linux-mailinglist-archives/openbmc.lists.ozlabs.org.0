Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3C3287698
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 17:01:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6ZDG2YsTzDqXX
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 02:01:50 +1100 (AEDT)
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
 header.s=20161025 header.b=E6//ibpQ; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6ZCP5zL4zDqDC
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2020 02:01:04 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id l85so6552388oih.10
 for <openbmc@lists.ozlabs.org>; Thu, 08 Oct 2020 08:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=nh3THa9XMDItMoj65tjKNdgFS41VEWd0dx23mNvWrtk=;
 b=E6//ibpQm1TIuPQ1+UdJEfnvltqTef2g+FP45pF0ulI7pFNcXNHzQKoOgUZZj4vMGi
 fRIdI20CNX4Nc6piJghk9trnrjOFVANrN3+N4//QUTPqN0N2u4D0kTyr3QoAaG4OGUcN
 vjc5rZBt3jcxSufz2jAzLkh3WubHXZ1O5B+z4wm+eT0GtJtXLUin8eNodkg8KD9p7N6d
 M/cMJNcTDlTz3Q4BKc0bvkKyM+d5BO89R88vbPuB+fXsIXBWK2qPTsqYCFS+U3T+u+fN
 d2XzDkEQ2tRy145QImNkIzQ8J7G5TcEJbPBYfF8fvyJd2+FfHALewPdDrH0eiLdGTXwZ
 aMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nh3THa9XMDItMoj65tjKNdgFS41VEWd0dx23mNvWrtk=;
 b=ZNyshqHeK8q7pRlfnXY0kXXv4V9GIWIUOPVgXP/CoTDwG4UdPJr1wQtHY9CmsbgUnb
 y/xkQ/cZ1Y6Tbn5rBiOscyESFTUr6qKKus/InOtH1JoSey1SNxmioHN4iYI/Jlyxi7/D
 BZdDVVIIpgjJx1YqRpWEJRkiNxefiuui2xexURMT/4bJEFriDq9YgGpb0c2IrMV4syjh
 XluZrA7EmDQWYyifmJiw+ZCdoUhgYLnIrzwX2ooAYv5Pu87py82pFrMou7ELqaZdOVE2
 DuOUe5xhRWrz1Lh+uAm8rJ84BdGVub2EZ4HMOLyjpcXW0FPwvtkOHpLxlYeRIcUyh8gA
 kmLw==
X-Gm-Message-State: AOAM533Y39X+cMhGRaQNgLpTLzBqOROfbZ9cfY4Rc39QMVUCkZ7XwruO
 ivvs9kOLOqsLBvXUEQautrVTYllOheEb9g==
X-Google-Smtp-Source: ABdhPJyl0sDsJvDp62/rUiP5NouOCvP/UAe9PjQylD1syraHwxsKd7tQ4YwvX+xpOls03nlZAToN3Q==
X-Received: by 2002:aca:4848:: with SMTP id v69mr5621838oia.25.1602169260708; 
 Thu, 08 Oct 2020 08:01:00 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id o9sm5297825oop.1.2020.10.08.08.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 08:00:59 -0700 (PDT)
Subject: Re: Heading out
To: James Feist <james.feist@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <9ca9dd09-b381-d0e9-bd63-9a23496c97e1@linux.intel.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <0918dc8c-9cd9-8366-18a8-46c7eabbb7b6@gmail.com>
Date: Thu, 8 Oct 2020 10:00:58 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <9ca9dd09-b381-d0e9-bd63-9a23496c97e1@linux.intel.com>
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

On 10/7/20 1:21 PM, James Feist wrote:
> Hi everyone,
> 
> This will be my last week on the OpenBMC project. I'll be moving on to 
> something unrelated to OpenBMC. It's been great working with you all. 

Thanks for all your work, all the best in your new role!

Kurt Taylor (krtaylor)

> All the repos I maintain have additional maintainers who will continue 
> to maintain those projects. I'll begin removing myself from the 
> maintainers lists shortly.
> 
> Best of luck with the project,
> 
> -James
> 
> feistjj@gmail.com

