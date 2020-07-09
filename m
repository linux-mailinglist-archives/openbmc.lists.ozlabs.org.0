Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBD121A5E2
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 19:34:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2jwD1VFrzDrDF
	for <lists+openbmc@lfdr.de>; Fri, 10 Jul 2020 03:34:20 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2jv01M8tzDrCP
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 03:33:14 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <43c012a93a02002b05c7032169e6c9df9727b187.camel@fuzziesquirrel.com>
Subject: Re: Reg new repository for Remote BIOS Configuration feature
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Sekar, Suryakanth" <suryakanth.sekar@linux.intel.com>, Deepak Kodihalli
 <dkodihal@linux.vnet.ibm.com>
Date: Thu, 09 Jul 2020 13:32:06 -0400
In-Reply-To: <0a75da4d-0254-c2dc-562d-956bd8a21786@linux.intel.com>
References: <OF695C3E91.9C1FA4CC-ON00258598.00304468-00258598.00304971@LocalDomain>
 <8c52e6de-d785-6e28-c186-eb05bc405831@linux.intel.com>
 <OF4F9A7C8E.67B55B6A-ON00258598.00314874-00258598.003165E6@notes.na.collabserv.com>
 <3631d9fa-52b1-0918-bf9c-af8cb21e0c4f@linux.intel.com>
 <204b12fe-85c3-97f1-fd16-a2b5a64e9c6b@linux.vnet.ibm.com>
 <0a75da4d-0254-c2dc-562d-956bd8a21786@linux.intel.com>
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

bios-settings-mgr repository created.
