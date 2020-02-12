Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A65415B2D4
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 22:35:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HtGn0xtPzDqSJ
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 08:35:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HtG437B3zDqJ7
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 08:34:52 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 13:33:39 -0800
X-IronPort-AV: E=Sophos;i="5.70,434,1574150400"; d="scan'208";a="347594107"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 13:33:38 -0800
Date: Wed, 12 Feb 2020 13:33:37 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
Subject: Re: bmcweb Security issue
Message-ID: <20200212213150.GG1676@mauery.jf.intel.com>
References: <c9b3bf2691d44614a07caedcf35b2541@SCL-EXCHMB-13.phoenix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <c9b3bf2691d44614a07caedcf35b2541@SCL-EXCHMB-13.phoenix.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12-Feb-2020 05:52 PM, Bruce Mitchell wrote:
>bmcweb Security issue: according to the The CA/Browser Forum https://cabforum.org/wp-content/uploads/CA-Browser-Forum-BR-1.6.7.pdf ;
>Subscriber Certificates issued after 1 March 2018 MUST have a Validity Period no greater than 825 days.
>
>In bmcweb's ssl_key_handler.hpp we have:
>            // Cert is valid for 10 years
>            X509_gmtime_adj(X509_get_notAfter(x509),
>                            60L * 60L * 24L * 365L * 10L);
>
>I believe we want this changed to the 825 days.

Self-signed certificates are not subscriber certificates.

This is a self-signed certificate, so really that is a bigger issue than 
the length of time that it is valid for. This certificate should only be 
trusted on a direct physical connection with no other machines. It is 
there only to facilitate uploading a valid key/certificate to the BMC.

It is not intended to be used for any amount of time.

--Vernon
