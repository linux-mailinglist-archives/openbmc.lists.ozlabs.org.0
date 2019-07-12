Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6814670C1
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 15:58:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lZK84QQ0zDqLk
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 23:58:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XxwLu4/U"; 
 dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lZHg6Xn5zDqvy
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jul 2019 23:57:35 +1000 (AEST)
Received: by mail-oi1-x234.google.com with SMTP id m206so7321494oib.12
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jul 2019 06:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=n2uyUlztJLYobRL/i6Al4SB21XKT7GjfJ+oVr1a9ECA=;
 b=XxwLu4/U6WaIsTHF/MTwyipGfLeeRZIqkgCcmfYePGmRZu4Mb9RlpGTB0ypbd3pWbG
 Rl5hohbmtoNnmJn4b2HO1THOzgME/JSEo7YGLhLJLcCrlEyB8YutE0ihSrv59ipaGpMR
 3jWFFzAD7Phnwnz+7xSu77/eVTa8EtONtlts3J4JdpuJbnMTaaceGCcs/LZsF/cO0jKT
 gZKU6l0wwjtKHHO2dP163mNp88ivoj78oHcy9ft6v3sBsork9A7bsb7kQwMJbrUaiJUm
 LibStCoDRsB8PgNGiHTHASEorICH/S/CH9fd3kOAVKQ8SzHVWw65X65+j/JYOQ9m45rn
 t5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n2uyUlztJLYobRL/i6Al4SB21XKT7GjfJ+oVr1a9ECA=;
 b=g8/2+3fwFsT0iWV9g4JYwYB5PhaM7z8vAp9YhL7AGwSe0ycVgdgEHffeKZ1dKZ+frA
 sxyyUh/BfnsRT3kfdcIVqY1RcewtlhJMPb7P8WodsSJd6dhATCPo0ekxNYwEasIp6jyT
 i5ai+DA/2S5xg4B5Gn+McVnZtR7cJZ2oMTzeO2LMDPqNOS5xBC+B/28SKARVWydvuijy
 fF0PTz0JjIHe3Hni3uIJAIo4krjFyOUvYzpIlMYiQQevVipClY5G3iU6nJugds3iJPG0
 eeEjk8WGvBR0lzPjO/5HVRWUWXmhRw8oGlN+Qs7qAf3Rh6pcocMFljFnUzr2W2Zg8zzj
 8ajg==
X-Gm-Message-State: APjAAAUodJeMvPhX+zxOBKUWw5Dt2t/h2iQlu1TFUeI/nkg/lxM2UCB8
 Y7//ghKadZL/jzVAZ8WSGlnzT/g9mRQ=
X-Google-Smtp-Source: APXvYqwqkMyyc2VPA8t6PjMiYJ198pyJ3B1dlxbd3pBO8mn2lYuAMQ7YeGfne5+hdKLwrwYPcjTxQQ==
X-Received: by 2002:aca:af0d:: with SMTP id y13mr6014313oie.171.1562939851667; 
 Fri, 12 Jul 2019 06:57:31 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id b23sm2850513otl.75.2019.07.12.06.57.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 06:57:31 -0700 (PDT)
Subject: Re: Adding to CLA
To: Scott Ingham <singham@amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <663E1F51-B36B-4E0C-820E-8F57A9C16C30@amperecomputing.com>
 <865C376D1B77624AAA570EFEF73CE52F98337E1C@fmsmsx118.amr.corp.intel.com>
 <DA5D7064-6E95-4DEB-A392-62467ECC4075@amperecomputing.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <5f96cbbd-1be4-6a50-e350-c459ace8caac@gmail.com>
Date: Fri, 12 Jul 2019 08:57:30 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <DA5D7064-6E95-4DEB-A392-62467ECC4075@amperecomputing.com>
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

On 7/11/19 6:41 PM, Scott Ingham wrote:
<snip>
> 
> Here’s the signed PDF. Let me know if you need anything else.


Scott,

All done. Thank you for keeping this schedule updated.

Kurt Taylor (krtaylor)


<snip>
> 
> Just send a PDF “Schedule A update 2019-07-XX.PDF” with text per 
> template below and send to the list (Brad or Kurt handle this most of 
> the time):
> 
> Schedule A – Updated *_Date_*__by *_Person sending the update_*
> 
> List of designated employees. NB: authorization is not tied to 
> particular Contributions.
> 
> Please indicate “CLA Manager” next to the name of any employees listed 
> below that are
> 
> authorized to add or remove designated employees from this list in the 
> future.
> 
> *Engineer Name 1 *
> 
> *Engineer Name 2*
> 
> *Added Engineer 3*
> 
> …
> 
> Thanks,
> 
> -Sharad
> 
> *From:*openbmc 
> [mailto:openbmc-bounces+sharad.khetan=intel.com@lists.ozlabs.org] *On 
> Behalf Of *Scott Ingham
> *Sent:* Wednesday, July 10, 2019 11:13 AM
> *To:* openbmc@lists.ozlabs.org
> *Subject:* Adding to CLA
> 
> Hi,
> 
> How do I go about getting folks added to our OpenBMC CLA? I see the 
> existing agreement but I don’t know how to add new people,
> 
> Thanks,
> 
> Scott Ingham
> 
> Ampere Computing
> 

