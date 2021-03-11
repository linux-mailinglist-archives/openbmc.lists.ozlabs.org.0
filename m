Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DAC337AEB
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 18:35:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxGL959Fzz3cVr
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 04:35:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=MbUx97Zo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22f;
 helo=mail-oi1-x22f.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MbUx97Zo; dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxGKx5RSdz30N8
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 04:34:58 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id y131so21090941oia.8
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 09:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CaWR/La/aL6Jg38Edkd6OoPVGYYEOnUmRccFU/5iEIE=;
 b=MbUx97ZoE7v3eUJhuh6mE2ErZVrvULLm1HlMuMmUIgR5U2ecUymDSqldtihGJI4lGj
 Wt47wUcm2QvmVHZseAZf/kIvGArn5jfglV8bLqnwK6TWYIZVz6k5fMTkKGt5eNP/6qVu
 gDV3r+iOqD23N9TR5BP4uaoTIRnR6tiFgo+72ncsJ/5j2l0z4gPWtC65py0BQbOZMOAO
 8EitVsrMGjltg5Z9+Y2PRaAtVZZFXMDeJZB36Wv5+elUi+xBqlCLGO2uja6FzV8f7fZh
 IsxwiNDcdde9oJM8U0V7mfpXwuaw+VlswtaNYQEdGFNNSNqiDg1Svi6JIOLEx+72ceTJ
 Hm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CaWR/La/aL6Jg38Edkd6OoPVGYYEOnUmRccFU/5iEIE=;
 b=pZKX8JyGt6QHAE7UO/jo+sHSbfAeKc0AW56feGgdPBbOFKjpWbFY/gAWmblPW5Cion
 5+jdZfUIoA4lSCjzICMRn04/N2Mm6EORhZxHX22Kc0SRC01FDD6rAfBapQj737sK7Yf8
 E5M4XF2HsNAgW0zGqUwMFohEWMDQAEBHxhqEd7plZI+f8iNru1EpKDl6OLwTqpISbczA
 GDgXJfEu9HHDhaXKPQ8WQMuvFufISVb/JdR47B14WTPBHSAmPTpgs+FiGtLTdXHa0gJK
 bFU38auSQnZ+du2sXTV3gPh+CleszgPQbUP43ZU7v4l8LQf4KbTFrUXHD7Fj8HKnKTzE
 ZTOA==
X-Gm-Message-State: AOAM530hBCFXJJ/RQEeA7jBE2qn/PZ4kyPZpK3n/PdnWjLdeiCqZGru9
 wefTUuXit7d1srJLVfZsJdBqaHK9E5mapQ==
X-Google-Smtp-Source: ABdhPJzXhrJWAjQg1557YsSZIX7UAzLg6a/4VYuIUWVEw2y6AXuB2erpBzBZA4QpQDWxJAfUc2ddcQ==
X-Received: by 2002:aca:d68e:: with SMTP id n136mr7372235oig.179.1615484093603; 
 Thu, 11 Mar 2021 09:34:53 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-104-102.res.spectrum.com.
 [72.182.104.102])
 by smtp.gmail.com with ESMTPSA id 3sm754954otw.58.2021.03.11.09.34.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 09:34:52 -0800 (PST)
Subject: Re: Bosch Sicherheitssysteme GmbH CCLA
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "Meisenecker Robert (BT/ETI-CS)" <Robert.Meisenecker@de.bosch.com>
References: <ab897f9a1daf4d7b900d64cf453aab69@de.bosch.com>
 <20210309213111.7puayatdyodbn7yg@thinkpad.fuzziesquirrel.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <00bda121-233b-0736-e789-113b3dd775a5@gmail.com>
Date: Thu, 11 Mar 2021 11:34:42 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309213111.7puayatdyodbn7yg@thinkpad.fuzziesquirrel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/9/21 3:31 PM, Brad Bishop wrote:
> On Tue, Mar 02, 2021 at 12:23:21PM +0000, Meisenecker Robert (BT/ETI-CS) 
> wrote:
>> Dear OpenBMC team,
>>
>> just to make sure that our contribution request from 2021-02-11 did 
>> not get lost:
>> please find our signed CCLA in the attachment.

Hi Robert, welcome!

I did not received email dated 2-11, but I had previously been working 
with Bosch to resolve a CCLA for pending contributions. Is this related 
to the email I sent about a year ago (Mark Jonas)?

If not, can you work with that team to resolve this? Maybe add them to 
your CCLA?

Also, your CCLA does not have any contributing developers (and CLA 
manager) listed on Schedule A. Please correct that at your earliest 
convenience.

Kurt Taylor (krtaylor)

> Hello Robert and Bosch.  It appears it did get lost - apologies for 
> that.  Your CCLA has been accepted - welcome Bosch!
> 
> thx - brad

