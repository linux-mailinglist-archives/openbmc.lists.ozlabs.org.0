Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D72FC100
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2019 08:52:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DDGQ5N9NzF4Tx
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2019 18:52:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="B3QTx8PD"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DDFl6tgDzF3By;
 Thu, 14 Nov 2019 18:51:39 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6BF9442E7D;
 Thu, 14 Nov 2019 07:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-disposition:content-type
 :content-type:mime-version:references:message-id:subject:subject
 :from:from:date:date:received:received:received; s=mta-01; t=
 1573717892; x=1575532293; bh=jziHo4Np4S3zpCUsEzn0y39Fo/WGUyBEkwt
 vnA6eXps=; b=B3QTx8PDJ1PGYmtRlcjtpbeGoDjAPyd9SSl/wUFV1CefKJpVvIV
 i1cI0xBJ6FufInWcbGRBlMR/MFBgiyojTmUVmf2sASk9mhOVeDkFQMy5liWgezvL
 yEb+EH6LlVlCCJeyaTME1P3MAJO9wpDXUKvdibpkk57KayTxJyooX/YA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vuI-BsiVrDo1; Thu, 14 Nov 2019 10:51:32 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 24395411D9;
 Thu, 14 Nov 2019 10:51:32 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 14
 Nov 2019 10:51:31 +0300
Date: Thu, 14 Nov 2019 10:51:31 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Adriana Kobylak <anoo@linux.ibm.com>
Subject: Re: Packaging and deploying multiple firmware image types in one
Message-ID: <20191114075131.GA6696@bbwork.lan>
References: <d9a820f4778cc2964d6f0a9b8a78d722@linux.vnet.ibm.com>
 <20191112074921.GA4938@bbwork.lan>
 <9ddc3deca00904404c72a49c4f89c8a4@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <9ddc3deca00904404c72a49c4f89c8a4@linux.vnet.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Originating-IP: [172.17.14.115]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
 openbmc@lists.ozlabs.org, "Alexander A. Filippov" <a.filippov@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Nov 12, 2019 at 04:54:22PM -0600, Adriana Kobylak wrote:
> 
> Yeah, the purpose is not currently preserved across reboots. I have a change
> here for that:
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-bmc-code-mgmt/+/27045
>

On Thu, Nov 14, 2019 at 03:14:41AM +0000, Adriana Kobylak (Code Review) wrote:
> ...
> but let's continue on the mailing list about your thoughts on how you think
> the tarball of tarballs should be handled.
>

Ok, here are my thoughts:
The phosphor-version-software-manager might put all internal tarballs in the
/tmp/images folder during processing the top level tarball. That will lead to
creation of corresponding D-Bus objects. Each of them will have their own
purpose, version, object path and so on.

The root D-Bus object and their folder might be removed after that  to reduce a
used file system space.

