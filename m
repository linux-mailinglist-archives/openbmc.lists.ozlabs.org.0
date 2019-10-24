Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F898E3202
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 14:14:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zR4H2S0NzDqV1
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 23:14:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234;
 helo=mail-oi1-x234.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tzJR91sN"; 
 dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zR326jWKzDqTq;
 Thu, 24 Oct 2019 23:13:02 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id 83so20407473oii.1;
 Thu, 24 Oct 2019 05:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8kJqdDErP8hEzWYVNVgFWcc3n0F2o+Mg5cnBjVcqzH8=;
 b=tzJR91sNeC56/b38oWN5I6r61v9ABQztHtxiQEug2u77BUhmbS/0/wXDIoyae4ZpMp
 2g/iazE00m8TrXwUgPi+zn5/0reZtMc4PDM3WlBgSa+JUv9jlUVDFAn5OVASTTLHBf0s
 Urt1bycaAH8DCRHElJmbDlbpKGCUle7Qvwj47bKVfgGoR4pHTH+qW5SipbRbgKWKjmxE
 +/i+eFDS1KkQyEyuH7MHLuD9L1rikyKf3HcG7ldj5YMazDm9nof9NGElkyeWt4rEwSx9
 BjVkMofJoLWM1A74zywNDl5B9hpBhazg4MxJCb2qFICOS3Z3PpSK6UK+lVaeXCOy+AZi
 i+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8kJqdDErP8hEzWYVNVgFWcc3n0F2o+Mg5cnBjVcqzH8=;
 b=LW/xG7jqCh5JQjfoBFrEf5W+sy9jW3mZQPxfVhYs6etLZhCu1hhNAFziKkmuMZNF6I
 to9F2/5YRxMw74Au7MySc8tqQpcHuXQlE0iIg7YOUTM7FwDA2i5DsD8rn3xP6VCqMgBD
 l6SocKgP/xvea+TtlXJKiSVnlgRvUvxXoho8pMApo182zU3BXShhxAJ0hYTN7t8Cu1Wg
 dY8z5y8ER+iwj7v+f6BI7DAVoVaeG+T+rWx9fRTceGkDv9NiIBr+iYdQVGIoKmHU6z/K
 YkrMQt2ksHFXuVgksafN0egoFjl08hE9SxSV9d5BrEv3JrocezB5l8mvt+OcHmbHIyly
 cCwQ==
X-Gm-Message-State: APjAAAWP6Z+eBnLo+H9ZGTtAhudYRcXvKjLJThVnzE++v52FlptnbDBu
 1j6bhgoB8To4KYqrvoqZ+cpWHYIB
X-Google-Smtp-Source: APXvYqw8CnWxepRFE0YubiJDcIh5ax2RKkJeJ75wVaynyVTGwI5ogp6rtEMyhA9oBDgcGyyl/8q4IA==
X-Received: by 2002:aca:d612:: with SMTP id n18mr4450486oig.120.1571919178841; 
 Thu, 24 Oct 2019 05:12:58 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id t18sm7128905otd.60.2019.10.24.05.12.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Oct 2019 05:12:58 -0700 (PDT)
Subject: Re: Improving the docs/ repo
To: Adriana Kobylak <anoo@linux.ibm.com>
References: <2c77cbfb-9df5-278c-8f76-06193e125514@linux.vnet.ibm.com>
 <3a4d96b9-8810-e57b-690d-5fd791bc57c0@gmail.com>
 <ae161ca3003366f6e1f260b83d932cc1@linux.vnet.ibm.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <1fba7f72-aaf8-2152-f983-66bf2f936ee3@gmail.com>
Date: Thu, 24 Oct 2019 07:12:57 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ae161ca3003366f6e1f260b83d932cc1@linux.vnet.ibm.com>
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 openbmc@lists.ozlabs.org, Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/23/19 10:22 AM, Adriana Kobylak wrote:
> On 2019-10-23 08:51, krtaylor wrote:
>> On 10/22/19 11:38 AM, Gunnar Mills wrote:
>>> Looking to improve the docs/ repository.
>>> Is anyone interested in getting involved in improving the document 
>>> repository? Looking for either ideas or contributions.
>>>
>>> Some ideas:
>>> Better document the process for submitting documents which should 
>>> improve the quality of documentation being submitted.
>>>
>>> Design template improvement, spell out any additional expectations 
>>> that come in review. E.g. All fields must be filled out, involve the 
>>> community before submitting a template, avoid internal acronyms, 
>>> expand on when the template is needed.
> 
> How do people feel about having smaller commits for the docs, like we 
> encourage for source code? Would it make it easier to review? An example 
> for designs would be one commit with the problem statement, next commit 
> adds the requirements, next adds one solution proposal, etc.

This is absolutely the way it *should* be. Commits and/or wip. For the 
IRC averse and design documents, it lets the community know what you are 
planning and gives them the ability to be involved early on.

Kurt Taylor (krtaylor)
