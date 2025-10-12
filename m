Return-Path: <openbmc+bounces-732-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A38BD09A0
	for <lists+openbmc@lfdr.de>; Sun, 12 Oct 2025 20:13:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cl7rS3f26z2xS2;
	Mon, 13 Oct 2025 05:13:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760292792;
	cv=none; b=Sm/SKGY9TCY1Z5rV3LW5S1+Qextt8Czc6iVxyzWbl1IjQ1Wrt03J94pLL1pmMOKrgH19NnaMHM9El2ptHxVS9U5I+6pv7/LJjxVfahyfUmibaIARQ+kpp1n05Fl/OXc68Rt9xKXA8EVBxA47bB/OCJDQA4xqLtdeW0DkNH2KGC3bdPR2YJyFOpiNb27StpfLFvSoVWJK0EIRnCqN3vC4uzNM2z0yGFUdYaAdosWltXV/MFXILZnWlgpxh7STLQpFc5uIt2QK9+5IfnjtJViR0TPk2WZBN2xDrpw7BvXu7tb6IcoT9D/KUMBtY19uSnNp7LGVW6vRadPusKhwIIFoBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760292792; c=relaxed/relaxed;
	bh=Ovw0jKQ6NyztYytq053H+NNFHTumfR3yxd0tQVKwQ8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWQBrjrupe1BBYhRQw7QEpfT1X7RSmQhNCP0G/5HT8r7EgG2D07rpNdLuyynx1fu/FjnF/ixa0VQ+UjW9AHSxCmk82gjaBWPyI0PnvrYln8hktyVTFCUuhKyNDFZKawkWelQ6+cq0eoNhoNdngfFJG/aPrrIisAo1HkERCWRxeSZ4Nl00NC8+tjZq746kzWo66nClHeew9iNj4L/nG4APLb8tVDf4uCcx5vgotm9Ag5Fs38fhIcZ5w4+S12O9jZAT0hqnZ6MEkjC9S6K5C3zcWNSqp9Px6fYiWi8NmOYd90pYMG14B6xqV0Y92tXpuYgE2WOebQq1IEpJiYSHZKPog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bvFQRQJ/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bvFQRQJ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cl7rR72nQz2xPx
	for <openbmc@lists.ozlabs.org>; Mon, 13 Oct 2025 05:13:11 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-27eceb38eb1so37342005ad.3
        for <openbmc@lists.ozlabs.org>; Sun, 12 Oct 2025 11:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760292790; x=1760897590; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ovw0jKQ6NyztYytq053H+NNFHTumfR3yxd0tQVKwQ8U=;
        b=bvFQRQJ/390FcN/oV2/6mqSXX3hoDNUyVLawc4/GDS0cTV5VGzeuF2bKg+MUyT1zUc
         Hdpn9//1S0TNYZ9FIBO7MhIXp46n8usxEumOmddmzAlBgHeR17/BS0yTfyw+UdfMg2r0
         2oCMEBM1ZKgE+vA/qvrRodiYRFJTe3BiXrB0Zn5bF8xRads3l9ySBLss4mYnGGg/T1ol
         pNcp81RTlOVUO3ugFERWSSk0/Cag2+pDRSf3s7MSdeYWyqJaUxoniXVvUnpw5MW+yv/7
         Iu2wf6Su2Q9qc1cD/qupIYlDN6DhSq6t1wB6XOlZMxBMn6AWLsrGpVba2boI/ynFgD4Y
         Pdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760292790; x=1760897590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ovw0jKQ6NyztYytq053H+NNFHTumfR3yxd0tQVKwQ8U=;
        b=Jpg6kksSLaWWoReYTM/3aTZvVOs2RC7jjxul83qVSZAbsHAYE5moS/3S2WZK4ADyCQ
         6qNo/iz1tT6ouEtckomR06b+jGTc5NZNlHcvwHZrWb3Mb0jk1xgYUyWm8Y4qivR3Mmfz
         20k9e3auqd3ptii0laEbeKzzy4d1kKRnTOqm4XoKuOvv2WsvqCTLH31s92hGgHVQhJYY
         t+xJ8Ti+roeAbcykE+5ejGz8Km1+7OANTn1NR+b62j/7cCmwwIRrnTIXAjI4rRVGZMQB
         DbLcK63inq0e6+K7m2QhadhBAlAzgFsPs6ha3QO/zuLgbY7w2lgBTMM3WWybEcKNU9Bl
         Y9Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXCwh9pUMiAUcBaIOyODh3bgpRXelZMFM5Bk2NktiRrcv/GRhLnUHmjcdBXoscxto7Z5HUGx/xt@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxME7ZmKFPJzOxP6i3j+xEnerHPlQCBoso0lLZhEpK08i0G33zm
	aXH5snkians9XVXlauxxvalVAa4ybY0B6C32zTFe8zJ3OVU5rP5p+mTb
X-Gm-Gg: ASbGncuzQUtjfAUIgldoWzW6oPvqMH+lEE/5lEvE4kiHS/LKThwC3SpLOMihWeLq5jo
	iEWBqxMj4ILpNHnZi0xhgDuvyOW4OpdZ4s39BzDlK2LRpP2J4UkPUS+A0kLrjJpHbORlNxzfr9v
	nUZWInrvX8FyVe2vGpnVyALWf1b3R/zoMm1YHg1PnwmZC8cKFM/b/W8WoG7epaab7XoPogDwoW2
	VX6Q1XJsLbQuEmb6d9CQ0e3JDy5+pEBaPLiQFkEDgPJNEcNClxWZ688zz3cxqEuhPeyviDTKnAp
	uGkif1h6ctdZpfMMyMAOm5W1b2/CYgqfWVSSWB4IPMPwBmXQb1OysC0z7Ipfbt4cb5P2oGpo0Uc
	kH2SgVsJOo0Kn57C8oLJgsYydRec+TAHWrUp0HAqaGO5DpLSiLO2WEw==
X-Google-Smtp-Source: AGHT+IEmQxCkFFO7UZ24b+yxERi/IFGxEwxA34m8F4M0YMaCMHA36BPDMhCCaeMBaLNEhVfkRsdkgQ==
X-Received: by 2002:a17:903:15c3:b0:27e:e55f:c6c3 with SMTP id d9443c01a7336-2902741d01bmr231063125ad.55.1760292790123;
        Sun, 12 Oct 2025 11:13:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f8770dsm110734015ad.117.2025.10.12.11.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 11:13:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Oct 2025 11:13:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ivan Mikhaylov <fr0st61te@gmail.com>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 3/3] hwmon: (peci/cputemp) add Intel Emerald Rapids
 support
Message-ID: <4afd6c92-887b-456d-a5e3-a615a595a834@roeck-us.net>
References: <20251006215321.5036-1-fr0st61te@gmail.com>
 <20251006215321.5036-4-fr0st61te@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006215321.5036-4-fr0st61te@gmail.com>
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 07, 2025 at 12:53:21AM +0300, Ivan Mikhaylov wrote:
> Add support to read DTS for reading Intel Emerald Rapids platform.
> 
> Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>

Applied to hwmon-next.

Thanks,
Guenter

