Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA1022B7DD
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 22:35:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCPHB3n47zDr2K
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 06:35:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=moZSrrj9; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCP9v4q8bzDrLw
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 06:31:15 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id t15so3704623pjq.5
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 13:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SoMKFcpv4t74SB8Z2NkuRMjIe/0+h4b+mMWIWDAYaYU=;
 b=moZSrrj97a74Nc/pOoLkHdIxGkJMIBvaN4MCZyP/qddEjK4L2MWvoKPQD8uCVx831j
 RfOtfgl9sqQfB502umQD1KhsSi5+67PIlFajeGRs+7yykXCT3AYW/c+fT6AxEZzPC16C
 Z27Z5J0x1rBRsl/S4ZSjxIRKngZ4160Y0FM//W1yeUi7SPx0fMNZQaTo8xBcBkw14er8
 j/eaqBnJdcbL65F0reIGMuUrckyoR36S9lA105nq3W54Vog9AryITBr5PGTccNC3mZ8v
 Um1eBO/0UO34ysI/NfHuxM5ksgsySjEQJt7PQTFfiLnkZexUYT3ZDLJg0fC7TAVkmP8A
 P/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SoMKFcpv4t74SB8Z2NkuRMjIe/0+h4b+mMWIWDAYaYU=;
 b=p5qmga2pkILJLyuiedmkQgBfdHJnWPLiIF+ZXP4V0Gwh5SmAY/dxTywlLjBESYM4QU
 a/y8ieHTHEwLSX978ep1D+8W5bSRT8YneymsHqTbgsk442qtzsNAU7nzCd2jQEgBVlkL
 L3of96LTh8EukJG/6n/uSmJnwYkndYPOKWISq01ntZ1kcOtYydXW8hvqChtJmGrLd4fs
 ZRkhUfeZ148Si2xHMLUVxgZYzTaXte9zxdoP4cIXBIen2P9PYDgqvIHkdPcHPyyIYVIc
 8/5728XG9XFubKOjl7LdKp9IdXBCDYQ3AiBR2V4ih1rSRQ0qX3RFGuF8uuLNBpSq+/ml
 k+XQ==
X-Gm-Message-State: AOAM533hPRAxlse6jJpG+zjacNyKoP3PU0zQdvjfadvZ9u7LRRDkQetM
 w/NurOCX/6x530GOlLpYw+Y=
X-Google-Smtp-Source: ABdhPJx2go2YkHBTuwtwoT4+X5KaYpS1F7Cy0YMI05T0ZKqVeW1Bp76GWNy4/si/a730W4IRFAtgVQ==
X-Received: by 2002:a17:902:e903:: with SMTP id
 k3mr5317399pld.148.1595536271659; 
 Thu, 23 Jul 2020 13:31:11 -0700 (PDT)
Received: from cnn ([112.133.236.10])
 by smtp.gmail.com with ESMTPSA id p29sm3684201pgl.36.2020.07.23.13.31.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Jul 2020 13:31:09 -0700 (PDT)
Date: Fri, 24 Jul 2020 02:01:04 +0530
From: Manikandan <manikandan.hcl.ers.epl@gmail.com>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: add multi-host support in the phosphor-post-code-manager
Message-ID: <20200723203104.GA4976@cnn>
References: <20200720160013.GB17117@cnn>
 <DM6PR11MB441079DE8A76ECF6C35E185094780@DM6PR11MB4410.namprd11.prod.outlook.com>
 <2EFB6403-DA2F-434F-87CE-B9EA917A2BE4@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2EFB6403-DA2F-434F-87CE-B9EA917A2BE4@fb.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: "Ren, Zhikui" <zhikui.ren@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "velumanit@hcl.com" <velumanit@hcl.com>, "Wang,
 Kuiying" <kuiying.wang@intel.com>,
 "manikandan.e@hcl.com" <manikandan.e@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 21, 2020 at 06:28:44PM +0000, Vijay Khemka wrote:
> I would also prefer single process design but as Patrick mentioned about hot pluggable 
> Host, either we can predefine maximum allowed host per platform or go for multi
> process  approach for complete dynamic pluggable host.
> 
> We really need to assess what is the disadvantage in predefining maximum number of hosts
> With single process because there will be limited slots available per platform.
   
Thanks Vijay for comment.

The Multi-host on obmc-console and x86-power-control design and implemetation based on 
multi-process as i checked source code.

As already obmc-console and x86-power-control agreed on multi-process , 
Is there specific reason we need to go for the single process design to support 
on multi-host postcode.

I understand that x86-power-control initially planned to have single process for multi-host
and then later changed to the multi-process.      

 
