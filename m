Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA0CD37AF
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 05:02:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qCRc5TXmzDqXW
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 14:02:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ozF2/VkD"; 
 dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qCQs2VvRzDqX9
 for <openbmc@lists.ozlabs.org>; Fri, 11 Oct 2019 14:01:38 +1100 (AEDT)
Received: by mail-io1-xd30.google.com with SMTP id q1so18459739ion.1
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 20:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=7Sm8RZ7BJINFs7Kg+ieKl53vYtfPDOcEmyHqf5I4RuI=;
 b=ozF2/VkDfNbX/l9npCXT3QmFnzwHIeTx3O16ioTJC758+kNuviwQ82cd7fe8iuL65x
 OVrxG6HEh0Lg/RaSBACW+33KnqeTAlc9k2MmwrSR++d5HBkn6v2FLhbEa858YyBu4hM3
 amHiZAVz5znkt2rUaU8eD7P0YRHGJ9ZVOAveWGK5q92jHmItmSiDpiWNA15IcKjE1Cxm
 AqJnsaeaw6ZGYVNQlYk8vYjfbyGQ4Ib80jhysGU4CXNxwAXN2TYPnFZTpwBibJPm9+Ju
 xhIc8au0RORKG1DLys26QWLZCDKfWXzJeEIsfnaQVm6KW/UnF2gp36oy8DoftPwwvRFb
 +0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7Sm8RZ7BJINFs7Kg+ieKl53vYtfPDOcEmyHqf5I4RuI=;
 b=hBrCN6dp4+WkqlWdinGlPJSMi8aCZPP1Tx2r6wSgdXiro9az1zgX1QODi+L4p6kQk4
 NrR4vFe/R1raz2xGXrxdeNCM0oMqmw970Ew0ei+2LcOXJZqhy6rt8IiGD1OrrIAKBcYh
 CxoD59plYeOVxlEZiYZ/eF+RhvaSf5RqCgkqmzBqoc37JrbbwpkUAuLyO/1wl5XneUBg
 Tn3n9MGQ+ZHGpIhEPLInQen5efIT/f4ZjyWlKr5llqsN7tVmzBcUvGShNIsdkkbyvUm+
 0pPph5VHnLtQSUe8VpUKrDFqso0of2AZtb5Tsj6qZBsTUB4x76ZUF0t/k5FKeR1Jk1CX
 DFPA==
X-Gm-Message-State: APjAAAXCdubLSH1oWFOpI6aS1/AwYP5NeTWOdeajgVB1tkqJAnXf00GB
 NpoB+SP3UA375T1uIasELzgW2ST3JR0meCPlfgtuNJdrQbK4YA==
X-Google-Smtp-Source: APXvYqztUuuliY0nz+E8V3knIw8jyvn89a1M84FkzZ23sPzJ1cZ0IJSC32Y1EAQI/nvsTGUdgXFY167tIeIKShNJVfg=
X-Received: by 2002:a5d:8b48:: with SMTP id c8mr14333685iot.64.1570762894134; 
 Thu, 10 Oct 2019 20:01:34 -0700 (PDT)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Fri, 11 Oct 2019 11:01:23 +0800
Message-ID: <CAARXrtkkYGh5wGLYDEhHkG9B8QL-9ezW=n_a9R4-Wy-h4UWHig@mail.gmail.com>
Subject: Getting DIMM size in Redfish
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Tanous,
 Ed" <ed.tanous@intel.com>
Content-Type: text/plain; charset="UTF-8"
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

This mail is to discuss how to get DIMM size in Redfish (bmcweb).

Currently, bmcweb does not report DIMM size because it's not
implemented, and we are trying to implement this.

The DIMM interface is defined in [phosphor-dbus-interface][1], which
does not provide any metadata.

For OpenPOWER systems, the size information is provided in `PrettyName`, e.g.

    "PrettyName": "DDR4-2666 32GiB 64-bit ECC RDIMM"

It is guaranteed to be a string with 5 parts, and we could parse this
string to get the size.
I do not know how other systems (e.g. x86 or ARM) get the DIMM size.

During the [review][2] , Ed suggested creating an appropriate
interface for the DIMM size.

It's a good suggestion, but it could be complicated to be implemented:
* The information is sent by host via inband IPMI as FRU;
* In ipmid, the code to handle FRU is generic and part of the code is
generated, so it could be hard to make a specific change for DIMM
size.

So the question to the community is, how other systems get the DIMM size?
Knowing this, we could try to design a generic method to handle the case.

Otherwise, we will have to write specific code, either in ipmid or in
bmcweb, to get such specific values.

Thanks!

[1]: https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Inventory/Item/Dimm.interface.yaml
[2]: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/25754
