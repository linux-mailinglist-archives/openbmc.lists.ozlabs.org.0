Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF79E887697
	for <lists+openbmc@lfdr.de>; Sat, 23 Mar 2024 03:10:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmills.xyz header.i=@gmills.xyz header.a=rsa-sha256 header.s=default header.b=b5w5HgH5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1jMp0CN9z3vZT
	for <lists+openbmc@lfdr.de>; Sat, 23 Mar 2024 13:10:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmills.xyz header.i=@gmills.xyz header.a=rsa-sha256 header.s=default header.b=b5w5HgH5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmills.xyz (client-ip=198.54.127.78; helo=mailout-pe-a.jellyfish.systems; envelope-from=gunnar@gmills.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 433 seconds by postgrey-1.37 at boromir; Sat, 23 Mar 2024 13:10:03 AEDT
Received: from mailout-pe-a.jellyfish.systems (mailout-pe-a.jellyfish.systems [198.54.127.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1jMH0PsCz3cN6
	for <openbmc@lists.ozlabs.org>; Sat, 23 Mar 2024 13:10:02 +1100 (AEDT)
Received: from output-router-9dd487c44-h5lp7 (unknown [10.35.5.64])
	by mailout-pe-a.jellyfish.systems (Postfix) with ESMTPA id 4V1jBs5WbBz9t1N;
	Sat, 23 Mar 2024 02:02:45 +0000 (UTC)
Received: from MTA-15.privateemail.com (unknown [10.50.14.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by NEW-01-3.privateemail.com (Postfix) with ESMTPS id AF31C1005888;
	Fri, 22 Mar 2024 22:02:45 -0400 (EDT)
Received: from mta-15.privateemail.com (localhost [127.0.0.1])
	by mta-15.privateemail.com (Postfix) with ESMTP id 7E31818000A4;
	Fri, 22 Mar 2024 22:02:45 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=gmills.xyz; s=default;
	t=1711159365; bh=H27JneEdQdTqfsda55KeKmgzOqs89+D3iMsnIQXHv8w=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=b5w5HgH5n/nNr4hYnBgdPaH+40SYiJfOEZ7chOaExAC11y8D6yVOrgJX9jsK0uF9x
	 DOxoQHr1WFxO3SsPg/6ccA1reELlMEkwfxt721HRG/k2ekxLkbEb2UDgwB86GQYInt
	 Ns0GAAIZUHSgR584dh16e6omALjlOzGwIGnJK7rGjNr+X9kEvtcFzHSF7D6V/CXxX8
	 CMdWB/xCHTMoXgxrDyR2tZ0Jk2ZXOGdOL6BXRw1ltbLhCScdPdFgWL4nKMSrrxI0b7
	 RcCsft1b6GBlKwOf0k7dR1OM1CKr5TRLbmaVvIrh9DPM8kQ0rW33vfeITHm5CSbYH7
	 LkLO4y8aRK7kg==
Received: from APP-15 (unknown [10.50.14.215])
	by mta-15.privateemail.com (Postfix) with ESMTPA;
	Fri, 22 Mar 2024 22:02:43 -0400 (EDT)
Date: Fri, 22 Mar 2024 20:02:43 -0600 (MDT)
From: Gunnar M <gunnar@gmills.xyz>
To: BASTIEN DESALLE <bastien.desalle@eviden.com>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <232402708.523006.1711159363340@privateemail.com>
In-Reply-To: <VI1PR0701MB7055D4C94C68082610E90E209E312@VI1PR0701MB7055.eurprd07.prod.outlook.com>
References: <VI1PR0701MB7055D4C94C68082610E90E209E312@VI1PR0701MB7055.eurprd07.prod.outlook.com>
Subject: Re: OpenBMC Compliance level for accessibility
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_523005_990507159.1711159363339"
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev59
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: "L. XAVIER SEBLIN" <ludovic-xavier.seblin@eviden.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_523005_990507159.1711159363339
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

 

> On 03/22/2024 11:13 AM MDT BASTIEN DESALLE <bastien.desalle@eviden.com> wrote:
>  
> 
> I am looking for a report of compliance to the WCAG.
> I have found on the OpenBmc Github Accessibility Conventions and Standards | OpenBMC Web UI Style Guide https://openbmc.github.io/webui-vue/guide/coding-standards/accessibility.html#accessibility-principles mention of WCAG as guideline But could not find any report of compliance.
> 
> Does it exist ? and if yes where can I find it.
> 
No report that I know of.
From the start, there was an effort for webui-vue to meet the Web Content Accessibility Guidelines (WCAG). Below are some commits in this area, and if we are not following any WCAG recommendations, we will always take patches.

https://github.com/search?q=repo%3Aopenbmc%2Fwebui-vue++Accessibility&type=commits&p=2

Thanks,
Gunnar

------=_Part_523005_990507159.1711159363339
MIME-Version: 1.0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!doctype html>
<html>
 <head> 
  <meta charset="UTF-8"> 
 </head>
 <body>
  <div>
   &nbsp;
  </div> 
  <blockquote type="cite"> 
   <div>
    On 03/22/2024 11:13 AM MDT BASTIEN DESALLE &lt;bastien.desalle@eviden.com&gt; wrote:
   </div> 
   <div>
    &nbsp;
   </div> 
   <div class="WordSection1"> 
    <p class="MsoNormal">I am looking for a report of compliance to the WCAG. <br>I have found on the OpenBmc Github <a href="https://openbmc.github.io/webui-vue/guide/coding-standards/accessibility.html#accessibility-principles">Accessibility Conventions and Standards | OpenBMC Web UI Style Guide</a> mention of WCAG as guideline But could not find any report of compliance. <br><br>Does it exist ? and if yes where can I find it.</p> 
   </div> 
  </blockquote> 
  <div>
   No report that I know of. 
  </div> 
  <div class="default-style">
   From the start, there was an effort for webui-vue to meet the Web Content Accessibility Guidelines (WCAG). Below are some commits in this area, and if we are not following any WCAG recommendations, we will always take patches. 
   <br>
   <br><a href="https://github.com/search?q=repo%3Aopenbmc%2Fwebui-vue++Accessibility&amp;type=commits&amp;p=2">https://github.com/search?q=repo%3Aopenbmc%2Fwebui-vue++Accessibility&amp;type=commits&amp;p=2</a>
   <br>
   <br>Thanks, 
   <br>Gunnar
  </div>
 </body>
</html>
------=_Part_523005_990507159.1711159363339--
