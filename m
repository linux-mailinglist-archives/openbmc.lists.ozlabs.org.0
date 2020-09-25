Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AA92794DB
	for <lists+openbmc@lfdr.de>; Sat, 26 Sep 2020 01:43:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BypQL0kpKzDqg4
	for <lists+openbmc@lfdr.de>; Sat, 26 Sep 2020 09:43:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=patrick_voelker@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=WXIFwtAo; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=WXIFwtAo; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BypPF5CHhzDqg7
 for <openbmc@lists.ozlabs.org>; Sat, 26 Sep 2020 09:42:37 +1000 (AEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1601077353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pXEE1MZxTz9sVNITVP3xKbupgtMyE9D8Phxe3gHRAHM=;
 b=WXIFwtAorGCI+Hxltq16RBWCTPs5eA6ZGf3cf3i1ydJdBZhZUysyRXBUBc+y6UtHzX0Itd
 iqa2Qqb1OGoLVt4QMREgxsnL61TikSeYbZSUAs4zFj3gyhJwGL0ETOaCU0r12zdjDEVoLs
 YRh3HtoeWr1wkqRD98fQJcvK8J2ozyo=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1601077353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pXEE1MZxTz9sVNITVP3xKbupgtMyE9D8Phxe3gHRAHM=;
 b=WXIFwtAorGCI+Hxltq16RBWCTPs5eA6ZGf3cf3i1ydJdBZhZUysyRXBUBc+y6UtHzX0Itd
 iqa2Qqb1OGoLVt4QMREgxsnL61TikSeYbZSUAs4zFj3gyhJwGL0ETOaCU0r12zdjDEVoLs
 YRh3HtoeWr1wkqRD98fQJcvK8J2ozyo=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-lOcxeXHhMXacd-awS23SEA-1; Fri, 25 Sep 2020 19:42:30 -0400
X-MC-Unique: lOcxeXHhMXacd-awS23SEA-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Fri, 25 Sep 2020 16:42:28 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Fri, 25 Sep 2020 16:42:28 -0700
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: "OpenBMC (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Subject: Inventory dbus to redfish mapping and debug
Thread-Topic: Inventory dbus to redfish mapping and debug
Thread-Index: AdaTlRTq1T1wYH7mQUOQkmsSx9pREA==
Date: Fri, 25 Sep 2020 23:42:28 +0000
Message-ID: <751cf58493c240fea37345954eb01d44@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.141]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=patrick_voelker@phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I'm trying to view my processor information that originates from SMBIOS.  I=
 can see readable info on the dbus with this command:
busctl introspect xyz.openbmc_project.Smbios.MDR_V1 /xyz/openbmc_project/in=
ventory/system/chassis/motherboard/cpu0

But if I ask redfish, I get an error (below.)  Can someone give me a pointe=
r on how to debug this?  I'm having trouble finding what maps the redfish q=
uery to the dbus and what log file I can check to see more information abou=
t the error.

https://<host>/redfish/v1/Systems/system/Processors/cpu0

{
    "@odata.id": "/redfish/v1/Systems/system/Processors/cpu0",
    "@odata.type": "#Processor.v1_7_0.Processor",
    "error": {
        "@Message.ExtendedInfo": [
            {
                "@odata.type": "#Message.v1_0_0.Message",
                "Message": "The request failed due to an internal service e=
rror.  The service is still operational.",
                "MessageArgs": [],
                "MessageId": "Base.1.4.0.InternalError",
                "Resolution": "Resubmit the request.  If the problem persis=
ts, consider resetting the service.",
                "Severity": "Critical"
            }
        ],
        "code": "Base.1.4.0.InternalError",
        "message": "The request failed due to an internal service error.  T=
he service is still operational."
    }
}

