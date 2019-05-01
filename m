Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA67410E27
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 22:41:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vVfT2ZmlzDqMt
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 06:41:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vVbm0TbbzDqMg
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 06:38:42 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 1 May 2019 16:39:27 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Zane Shelley <zshelle@linux.ibm.com>
Subject: Re: meson issue in romulus SDK
Message-ID: <20190501203927.bwkmxeuvuq4ytgnk@thinkpad.dyn.fuzziesquirrel.com>
References: <57aa38106d2f0c5e0a08eafa8a219aef@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <57aa38106d2f0c5e0a08eafa8a219aef@linux.vnet.ibm.com>
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

On Wed, May 01, 2019 at 10:40:35AM -0500, Zane Shelley wrote:
>I'm just getting into meson. The manual for meson at mesonbuild.com 
>indicates the command syntax is 'meson [command] [arguments] 
>[options]', which is consistent with the version of meson I have 
>installed on Ubuntu 18.04 ('meson -v' returns 0.45.1). However, when I 
>source the romulus SDK that I built this morning ('meson -v' returns 
>0.49.2), it doesn't understand the [command] argument. For example:
>
>$ meson init
>
>ERROR: Neither directory contains a build file meson.build.
>$ ls
>init
>
>I think this version of meson tried to build what is in ./ and put it 
>in init/. Could anyone explain why this behavior is different?
>
>-- 
>- Zane

Hi Zane

For getting your feet wet with OpenBMC + meson could you forgo the SDK
and cross compiling and use the docker CI environment?...SDK support for
meson is missing a few minor things right now.  Are you able to install
docker somewhere?  Then you can do something like this:

export WORKSPACE=/home/andrewg/Code/ && \ 
    export UNIT_TEST_PKG=obmc-ikvm && \ 
    ./openbmc-build-scripts/run-unit-test-docker.sh

thx - brad
