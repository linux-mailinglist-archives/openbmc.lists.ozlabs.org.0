Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB7D125D41
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 10:07:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dmH1094JzDqq8
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 20:07:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="JdvQvWbd"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dmGM1bNSzDqlS
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 20:06:50 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2A33D438D1
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 09:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-transfer-encoding:content-disposition
 :content-type:content-type:mime-version:references:message-id
 :subject:subject:from:from:date:date:received:received:received;
 s=mta-01; t=1576746405; x=1578560806; bh=32Xv7G1K0fxY3omWHaaMuV
 qef74TF/hDX1chJTsC0Cw=; b=JdvQvWbdLnBVvAjnXJU7fqKimmpRznnbkM7m4D
 GTlyZ2HzJikCS1/qVWQNje63v6Ru2LoPKLd4tuZwbazWzXdquQXaBwGI9EQ6pe9I
 TZpf1VCNPOkFIkFasASiDNNFq+Q1ncJITsSO8diqJhPf0zLAQmOXjbFg1zYMFkwo
 gc5QA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0icUmOvt0ckm for <openbmc@lists.ozlabs.org>;
 Thu, 19 Dec 2019 12:06:45 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 38E8542F14
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 12:06:45 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 19
 Dec 2019 12:06:44 +0300
Date: Thu, 19 Dec 2019 12:06:44 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Subject: Re: ipmid-new.cpp log<level::ERR> entry cannot output
Message-ID: <20191219090644.GA16866@bbwork.lan>
References: <630491b9.b0a5.16eb1614767.Coremail.xiaoqian1641@163.com>
 <1f0e7d00.afd5.16f1d623df2.Coremail.xiaoqian1641@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f0e7d00.afd5.16f1d623df2.Coremail.xiaoqian1641@163.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Dec 19, 2019 at 04:59:35PM +0800, 常晓明 wrote:
> Hi, Team,
> 
> 
> phosphor-ipmi-host/ipmid-new.cpp has lot log<level:ERR>("Something messages",  entry("CHANNEL=%u", channel))
> But journalctl just saves "Something messages" , cannot save the message of entry("CHANNEL=%u", channel).
> 
> 
> Does anybody know this?

Try `journalctl --output verbose`

> 
> 
> Johny
