Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 980385E70D2
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 02:47:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYYQ04Y0Xz3c75
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 10:47:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CnUtdlr3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CnUtdlr3;
	dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYYPX3wFqz3bSS;
	Fri, 23 Sep 2022 10:46:39 +1000 (AEST)
Received: by mail-qt1-x833.google.com with SMTP id r20so7496147qtn.12;
        Thu, 22 Sep 2022 17:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=mXVWJIJwSO3raPa9ufywv7c+77gnmVznFVtzSWE/PWI=;
        b=CnUtdlr3MflXY9APdCyGECCKCC6Tg9h7Xm0eVaSftVCuFpx60N0VpT3gsXKWp2kJTY
         BXfmkKkmCmMzeBqeM5TSPaMsFazVxYCHrB9XzOgVrMnFKe3GXPL9xlqeXzL71fci+GQQ
         1xYLa7an7rxSru244yJW+eB9FK8APVNsjDKGTjwtGH7hKxgKNOS0B5QptjEbE04XDya7
         3zsVN2/eKX24VQntvodQAVNVCUPnO7xHK7i8AYcAo4Z+kwLOlvwVEbVBcMyipjuBhQIL
         ZEE/yM3/2wqIf/Gz7jH880f9PvFOwqvoAYltFFZAufrTg6Lrk5XgGIlT8vo3hY8RiTex
         i16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date;
        bh=mXVWJIJwSO3raPa9ufywv7c+77gnmVznFVtzSWE/PWI=;
        b=p06SYqREFDFcWjHxe35foBnfQBfEikuAwL6pf16BlVDQTXxdtsFhaohAxhaaQA1Qoc
         XOLJ+9nTWRQon0+LSgq7yMyVp39a809/jBSsp4Faq/aSGDyHxRFEiM1GjWaIVtfYNn6U
         Q3uZN3KezpENbsfmjwTPlSC24VJhtpM6SlBVvA/02pQQfMDVrZTyyRuQHbVkMMRdrrHv
         hhXf6UuANEVVXZm+whfVUwERb6Z/ER17ulggpMd04/Eb7l6ratfGhNq3BJb+B0OubK2c
         GVagftpRbjHsGLMJy7His8X4PCbn2OIu0iabB6xyuN985XlnQhW4C7ewdt3xHNQGrSMl
         +LHQ==
X-Gm-Message-State: ACrzQf1Z8W3S5XZO2f03eW/lt0N9y/aQH6U11ApZ3/go6reY485nZkup
	BKUCHYWevdXr4dktajRMfAGQprtMqb2f
X-Google-Smtp-Source: AMsMyM7Vwi8UT8AzmcUsgZ+9Dfnkxh4vwpyYFitMUQ1x78fA2yBEqtNkAHc+z3c3ThqM2bEfFYa5lA==
X-Received: by 2002:ac8:578c:0:b0:35c:d9fe:98f7 with SMTP id v12-20020ac8578c000000b0035cd9fe98f7mr5175139qta.360.1663893994524;
        Thu, 22 Sep 2022 17:46:34 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id br30-20020a05620a461e00b006ceafb1aa92sm5152695qkb.96.2022.09.22.17.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 17:46:33 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:5d3f:d09:85d2:d6e])
	by serve.minyard.net (Postfix) with ESMTPSA id 9E69A180015;
	Fri, 23 Sep 2022 00:46:32 +0000 (UTC)
Date: Thu, 22 Sep 2022 19:46:31 -0500
From: Corey Minyard <minyard@acm.org>
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH] ipmi: kcs: aspeed: Update port address comments
Message-ID: <Yy0B5+jzc7R7Drz7@minyard.net>
References: <20220920020333.601-1-chiawei_wang@aspeedtech.com>
 <YyywI8265vECnEHv@minyard.net>
 <HK0PR06MB37794D51E9DB4A864249F96691519@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <Yyz70LckHqyiNhGa@minyard.net>
 <HK0PR06MB377992E9AF7B91CE41452B4A91519@HK0PR06MB3779.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HK0PR06MB377992E9AF7B91CE41452B4A91519@HK0PR06MB3779.apcprd06.prod.outlook.com>
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
Reply-To: minyard@acm.org
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "andrew@aj.id.au" <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "openipmi-developer@lists.sourceforge.net" <openipmi-developer@lists.sourceforge.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 23, 2022 at 12:38:08AM +0000, ChiaWei Wang wrote:
> > From: Corey Minyard <tcminyard@gmail.com> On Behalf Of Corey Minyard
> > Sent: Friday, September 23, 2022 8:21 AM
> > 
> > On Fri, Sep 23, 2022 at 12:08:07AM +0000, ChiaWei Wang wrote:
> > > Hi Corey,
> > >
> > > > From: Corey Minyard <tcminyard@gmail.com> On Behalf Of Corey
> > Minyard
> > > > Sent: Friday, September 23, 2022 2:58 AM
> > > >
> > > > On Tue, Sep 20, 2022 at 10:03:33AM +0800, Chia-Wei Wang wrote:
> > > > > Remove AST_usrGuide_KCS.pdf as it is no longer maintained.
> > > >
> > > > Even if it's no longer maintained, is it useful?  It seems better to
> > > > leave in useful documentation unless it has been replaced with something
> > else.
> > >
> > > This document has no permeant public link to access.
> > > Aspeed has dropped this file but we keep receiving customer request asking
> > for this document.
> > > The most important part regarding KCS port rule is still kept in the updated
> > comment.
> > 
> > I mean, if you have code that is implementing what is documented, why did
> > you remove the document?  I don't understand why you would retire
> > documentation that people still want to use.
> > 
> > I could put it on the IPMI sourceforge or github page as a historical document.
> 
> This document is a personal note of one of our former employee.
> It is known to only the owner and his supporting customers.
> Most of us has no access to this document.
> In addition, after chip revision, certain information is not guaranteed anymore.

Ok, I'll take the patch.  Thanks.

-corey

> 
> Regards,
> Chiawei
