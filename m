Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E43C6140DEC
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 16:31:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zlRH5jTszDqxD
	for <lists+openbmc@lfdr.de>; Sat, 18 Jan 2020 02:31:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zhLg51j9zDqcR
 for <openbmc@lists.ozlabs.org>; Sat, 18 Jan 2020 00:12:41 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: Moving the WebUI to Vue; Repo vs Branch
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <4dc89e63-f99b-3df1-b4a6-f80ca996c440@linux.vnet.ibm.com>
Date: Fri, 17 Jan 2020 08:12:34 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <F8F79845-FD04-4457-8B30-FBC98F4D0FB8@fuzziesquirrel.com>
References: <60d44fed-74e2-70e3-e91f-ae1289d1700f@linux.vnet.ibm.com>
 <f560dbcf-1003-1dac-92ca-358d090a90ac@linux.vnet.ibm.com>
 <4dc89e63-f99b-3df1-b4a6-f80ca996c440@linux.vnet.ibm.com>
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Derick <derick.montague@gmail.com>, Yoshie Muranaka <yoshiemuranaka@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


> On Jan 15, 2020, at 12:54 PM, Gunnar Mills <gmills@linux.vnet.ibm.com> =
wrote:
> Brad, could you create this repo?
> webui-vue as a possible name but up for other suggestions.
>=20

webui-vue created=
