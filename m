Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F17D6C08
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 01:29:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sZXV3BLQzDqwL
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 10:29:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VFGs3Bao"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ADe3vhDk"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sZWs2x7WzDqvW
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 10:29:12 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 973FE22138;
 Mon, 14 Oct 2019 19:29:09 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 14 Oct 2019 19:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=MI954T6BYsXrFT8xtr157uEssMWMxmp
 9gCRiKCETW5c=; b=VFGs3BaoWFVPeKjr3c1Vm0zebPGokrXPTQPT4gxJws97XdM
 brToAE101tv4xyf//QJRS9+6zeGHfDeBpGIGCqdOF8xVYgOo8hx7JAnOlJp3mR6F
 Y78wwz6FgF2cwV+XWYOXnndAz5H4jSWPC0Y784Y2aZMm3PhHMIkEI6ZpPQaXCSn7
 h2yVLQRWU0hVcFF0iheb29R+SJ4m/BiJdie/Pa31P1NlKNXLv0Qzegn0zPqB0a1P
 qXZSOrdNWFVuINxM3WDbpjUimdErHKGvTjKwelEl0BhU6g/donAlgyfP4r7vyb+j
 o7ief9UZWe/bcf2eumCZH1l88XEeN8XDSe7sLqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=MI954T
 6BYsXrFT8xtr157uEssMWMxmp9gCRiKCETW5c=; b=ADe3vhDkfwGOsevRd+RyrT
 R+yAYNW+4ONI81TfLzq6br4RZhVtGoozEGKKsyhFJeeuDlYlA+Pczbot5c6Un7YH
 Sg7l3wZRGIeZu96Gf8oaObFWcM49pth8jTRlsaKiIpT5n4tgSSNNpl19OfbF97YX
 hsNQ5ZWtCnYLy7TqWtKmPQegbD4rKhIByOwt0CFl9G3e/aWUq5kWBWRd+ct9ssPw
 KLaLRfvdwA6F5JXDkZOYnm1wDTuQzPO6o61xaXTvZ9o0SVbZh10s1ioR5bRitLvq
 GHDgMb3zz/HOzuvXKJPmR0hBsiObliJN2njEX5Ir8ILgxWE/pgvl0TsPA0E+vFqw
 ==
X-ME-Sender: <xms:xASlXQESLh3U2U2y-GlMat8Q0uigro0XqcX2H8_GdVqbzPqgjrI2yg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjedvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:xASlXZtXFZKyZqxk--Z9FP6LQm4uxg9muKTI9wprBryHOZHhP8EO0w>
 <xmx:xASlXSBVoIvm5S19xYQaaCzJMG_5Avig0i85yo4IsRXeLKXu0E-LIA>
 <xmx:xASlXfzeK-6grEz_v5W_OodeAtPk9CU2RhoLGdIdX7tNrqXqUc593w>
 <xmx:xQSlXfGibXhSE5P7r6KZz0f7AvylVEOe-7TNPTh_8gZOV8KSQ6Lupw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7A46BE00A5; Mon, 14 Oct 2019 19:29:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <c36233ce-9ed8-43a2-ab4b-5358eb1807f3@www.fastmail.com>
In-Reply-To: <20191014132140.7618-2-joel@jms.id.au>
References: <20191014132140.7618-1-joel@jms.id.au>
 <20191014132140.7618-2-joel@jms.id.au>
Date: Tue, 15 Oct 2019 10:00:03 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.3 1/2] fsi: aspeed: Remove base from trace
Content-Type: text/plain
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 14 Oct 2019, at 23:51, Joel Stanley wrote:
> The base was showing the virtual address of the FSI master, which was
> not useful for most users of the tracepoint.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
