Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E0FD37BA
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 05:12:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qCfs2vHlzDqXt
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 14:12:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qCf41v4hzDqV4;
 Fri, 11 Oct 2019 14:11:23 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x9B3AiNi016659;
 Thu, 10 Oct 2019 22:10:45 -0500
Message-ID: <158fa0872643089750b3797fd2f78ba18eaf488c.camel@kernel.crashing.org>
Subject: Re: [PATCH] ftgmac100: Disable HW checksum generation on AST2500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Vijay Khemka <vijaykhemka@fb.com>, Joel Stanley <joel@jms.id.au>,
 Florian Fainelli <f.fainelli@gmail.com>
Date: Fri, 11 Oct 2019 14:10:44 +1100
In-Reply-To: <AF7B985F-6E42-4CD4-B3D0-4B9EA42253C9@fb.com>
References: <20190910213734.3112330-1-vijaykhemka@fb.com>
 <bd5eab2e-6ba6-9e27-54d4-d9534da9d5f7@gmail.com>
 <CACPK8XcS4iKfKigPbPg0BFbmjbT-kdyjiPDXjk1k5XaS5bCdAA@mail.gmail.com>
 <95e215664612c0487808c02232852ef2188c95a5.camel@kernel.crashing.org>
 <AF7B985F-6E42-4CD4-B3D0-4B9EA42253C9@fb.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Andrew Lunn <andrew@lunn.ch>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 YueHaibing <yuehaibing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2019-10-10 at 19:15 +0000, Vijay Khemka wrote:
>     Any news on this ? AST2400 has no HW checksum logic in HW, AST2500
>     should work for IPV4 fine, we should only selectively disable it for
>     IPV6.
> 
> Ben, I have already sent v2 for this with requested change which only disable 
> for IPV6 in AST2500. I can send it again.

I didn't see it, did you CC me ? I maintain that driver...

Cheers,
Ben.


