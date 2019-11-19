Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC92710283A
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 16:39:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HVNd69DpzDqfM
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 02:38:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c;
 helo=mail-ot1-x32c.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z4PQnNMQ"; 
 dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HVMX14YQzDqWp
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 02:38:00 +1100 (AEDT)
Received: by mail-ot1-x32c.google.com with SMTP id c19so18202078otr.11
 for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2019 07:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=1CqYt20lGJ+uX/oonmWD5UuyuWrPKoWT9r/Bo3O5XAA=;
 b=Z4PQnNMQjZupnelsTVxOGggzrt3gogLaIlPWfE3DSgb78yZ24gPWfEbwFasv6/Gg/P
 Ib2WgakQ9EokgGi2salR37fSRbd96upzgh6pjaHkfDwATcFEMGb5/lZvo34hhjOnYlkd
 Bg+ESGhkPHyZl77fJ5cPOYFZlcbFjJia+emBzXSW0Lp0NuvwGdRRX8gCpA3vYDcKRY7r
 QQ4OwmjND2Xeyyv+Ryqb19DBNYEmwtZvhZLSCaQqvA2be7ckOxSqePqCFdFSHxHTTGxL
 cFdECdKQLFUQVWgeYzqzZiab1hDDWrdBgqzemTKsypS9Y5+huIrTil6lngGm7OFPN3k1
 b8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=1CqYt20lGJ+uX/oonmWD5UuyuWrPKoWT9r/Bo3O5XAA=;
 b=fNj5SN4dq4/ckfdCnLxl1E57ZyCWAwZprwWtEVE4MGyyR0hMk5dgqFlH/Z2gii/KwA
 0cGc3R767ACiYkUnMRByeo1HZbTp/jgsxOFUBeIbAk7luDtdCgjmIURuWHvH+xBMfnDR
 mTkjIAh040I1u12Tl5yUw/zhwXSxQM30ZHJKRIvVgwF5PWr4jwuNAVOxbSeTJC+jELKs
 wwMqw11uF/V3h0qDGwwgASmy91evwBpkkrwF2Mk15zOtkJcvt3mdT2bxRgJL9VMkSYwj
 3hJ3BxsUO4MhwZVwv178rNmXcUcZ1W8ZR1pf5I3gY49M2DNaLMyOijvnOevC0A52Vd0A
 gLpw==
X-Gm-Message-State: APjAAAWkv6HAvsVtVpd+WWOp/Vy5+vMYdJepO0R1OYvmsdZYAIo17MGa
 rfc5XbBzOdxoRXq6O1oVvLQ=
X-Google-Smtp-Source: APXvYqxSD3EWq5sWimJoZ5egA7584F4mBYaLWIi69G6CfiqVYrmjjaQ0VCA7i4VWsI09cg8VOpbwaw==
X-Received: by 2002:a05:6830:55a:: with SMTP id
 l26mr4323989otb.144.1574177876489; 
 Tue, 19 Nov 2019 07:37:56 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:c810:fa2c:7dc8:2e7f])
 by smtp.gmail.com with ESMTPSA id y23sm7123398oih.17.2019.11.19.07.37.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Nov 2019 07:37:55 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: Re-joining the project
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <20191119001526.GB98839@patrickw3-mbp.lan>
Date: Tue, 19 Nov 2019 09:37:55 -0600
Content-Transfer-Encoding: 7bit
Message-Id: <ED91B0D1-9C81-43CB-9234-4679F6C6A70D@gmail.com>
References: <20170925113628.GA4313@heinlein.lan>
 <20191119001526.GB98839@patrickw3-mbp.lan>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3601.0.10)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Nov 18, 2019, at 6:15 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
> 
> On Mon, Sep 25, 2017 at 06:36:29AM -0500, Patrick Williams wrote:
>> (deleted a bunch of text)
>> -- 
>> Patrick Williams
> 
> Hello!  Observant individuals might have noticed that Sai added a
> familiar name to the FB CLA.  I started at Facebook a few weeks
> ago and will be a developer on the OpenBMC team here.  Lots of 
> aspects of the project have changed and I have two years worth of
> mailing list emails to catch up on, so it'll be a while before I'm
> ramped up much here, but I will be starting to participate more
> regularly now.  Looking forward to catching up!
> 
> -- 
> Patrick Williams

Welcome back! Any big features or functions on Facebooks
list for OpenBMC?

Andrew
